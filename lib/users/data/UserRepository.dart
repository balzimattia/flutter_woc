import 'dart:convert';

import 'package:flutter_woc/supabase/Tables.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

abstract interface class ClienteUserRepositoryInterface {
  Future<List<UserModel>> searchCoachesList(String search);
}


abstract interface class CoachUserRepositoryInterface {
  Future<List<UserModel>> getClientiList(String coachId);
}


class UserRepository implements ClienteUserRepositoryInterface, CoachUserRepositoryInterface {
  UserRepository._();
  static final UserRepository instance = UserRepository._();

  final SupabaseClient _supabase = Supabase.instance.client;
  final userTable = Tables.users;


  @override
  Future<List<UserModel>> getClientiList(String coachId) async {
    final cr = Tables.coachingRelations;

    final response = await _supabase.from(userTable.tableName).select('*, ${cr.tableName}!${cr.clienteId}!inner()')
    .eq(userTable.role, UserRole.cliente.toRoleString).eq('${cr.tableName}.${cr.coachId}', coachId);

    return response.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<List<UserModel>> searchCoachesList(String search) async {
    final response = await _supabase.from(userTable.tableName).select()
        .eq(userTable.role, UserRole.coach.toRoleString).ilike(userTable.name, '%$search%');

    return response.map((json) => UserModel.fromJson(json)).toList();
  }

}