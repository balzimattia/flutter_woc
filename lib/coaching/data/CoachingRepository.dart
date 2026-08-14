import 'package:flutter_woc/coaching/data/models/CoachingRelation.dart';
import 'package:flutter_woc/coaching/data/models/CoachingRequest.dart';
import 'package:flutter_woc/supabase/Tables.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

abstract interface class CoachingRequestRepositoryInterface {
  Future<void> addRequest(String coachId);
  Future<void> updateRequest(bool isAccepted, String clienteId);
  Future<List<UserModel>> retrieveRequestsList();
  Future<RequestStatus?> getClientePendingRequest(String clienteId);
  Future<void> deletePendingRequest();
}

abstract interface class CoachingRelationRepositoryInterface {
  Future<void> removeCoachingRelation(String clienteId);
  Future<UserModel?> getClienteOwnCoach(String clienteId);
}


class CoachingRepository implements CoachingRequestRepositoryInterface, CoachingRelationRepositoryInterface {
  CoachingRepository._();
  static final CoachingRepository instance = CoachingRepository._();

  final SupabaseClient _supabase = Supabase.instance.client;

  final cRequestTable = Tables.coachRequests;
  final cRelationTable = Tables.coachingRelations;

  @override
  Future<void> addRequest(String coachId) async {
    final clienteId = _supabase.auth.currentUser?.id;

    if(clienteId != null) {
      final request = CoachingRequest(coachId: coachId, clienteId: clienteId, status: RequestStatus.pending);
      await _supabase.from(cRequestTable.tableName).insert(request);
    }
  }

  @override
  Future<void> deletePendingRequest() async {
    final clienteId = _supabase.auth.currentUser?.id;
    if(clienteId == null) return;

    await _supabase.from(cRequestTable.tableName).delete().eq(cRequestTable.clienteId, clienteId).eq(cRequestTable.status, RequestStatus.pending.toStatusString);
  }

  @override
  Future<UserModel?> getClienteOwnCoach(String clienteId) async {
    final userTable = Tables.users;
    final response = await _supabase.from(userTable.tableName).select('*, ${cRelationTable.tableName}!inner!coachId(*)')
        .eq('${cRelationTable.tableName}.${cRelationTable.clienteId}', clienteId);

    return response.map((json) => UserModel.fromJson(json)).singleOrNull;
  }

  @override
  Future<RequestStatus?> getClientePendingRequest(String clienteId) async {
    final response = await _supabase.from(cRequestTable.tableName).select()
        .eq(cRequestTable.clienteId, clienteId).eq(cRequestTable.status, RequestStatus.pending.toStatusString);

    if(response.isEmpty) return null;

    final String statusString = response.first[cRequestTable.status];
    return RequestStatus.values.firstWhere(
            (e) => e.toStatusString == statusString
    );
  }

  @override
  Future<void> removeCoachingRelation(String clienteId) async {
    await _supabase.from(cRelationTable.tableName).delete().eq(cRelationTable.clienteId, clienteId);
  }

  @override
  Future<List<UserModel>> retrieveRequestsList() async {
    final currentUserId = _supabase.auth.currentUser?.id ?? (throw Exception('Utente non loggato'));
    final userTable = Tables.users;

    final response = await _supabase.from(userTable.tableName).select('*, ${cRequestTable.tableName}!inner!clienteId(*)')
    .eq('${cRequestTable.tableName}.${cRequestTable.coachId}', currentUserId).eq('${cRequestTable.tableName}.${cRequestTable.status}', RequestStatus.pending.toStatusString);

    return response.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<void> updateRequest(bool isAccepted, String clienteId) async {
    final currentUserId = _supabase.auth.currentUser?.id;

    if(currentUserId != null) {
      final newStatus = isAccepted ? RequestStatus.accepted : RequestStatus.rejected;
      await _supabase.from(cRequestTable.tableName).update(
          {cRequestTable.status: newStatus.toStatusString}).eq(
          cRequestTable.clienteId, clienteId).eq(
          cRequestTable.status, RequestStatus.pending.toStatusString);

      if(isAccepted) {
        final cr = CoachingRelation(coachId: currentUserId, clienteId: clienteId);
        await _supabase.from(cRelationTable.tableName).insert(cr);
      }
    }
  }
}