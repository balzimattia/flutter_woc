import 'package:flutter_woc/programs/data/models/ProgramSheet.dart';
import 'package:flutter_woc/programs/data/models/Program.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../supabase/Tables.dart';

abstract interface class ProgramsRepositoryInterface {
  Future<ProgramSheet> getProgram(String clienteId, int programNumber);
  Future<int> getLatestProgramNumber(String clienteId);
  Future<List<ProgramSheet>> getProgramsList(String clienteId);
}

abstract interface class ClienteProgramsRepositoryInterface
    implements ProgramsRepositoryInterface {
  Future<void> updateProgramAsCliente(ProgramSheet updatedProgramSheet);
}

abstract interface class CoachProgramsRepositoryInterface
    implements ProgramsRepositoryInterface {
  Future<void> addProgram(String clienteId, ProgramSheet programSheet);
  Future<void> updateProgram(String clienteId, ProgramSheet updatedProgramSheet);
}


class ProgramsRepository
    implements CoachProgramsRepositoryInterface, ClienteProgramsRepositoryInterface {
  ProgramsRepository._();
  static final ProgramsRepository instance = ProgramsRepository._();

  final SupabaseClient _supabase = Supabase.instance.client;
  final _pTable = Tables.programs;

  Future<Program> _getRow(String clienteId) async {
    final response = await _supabase.from(_pTable.tableName).select().eq(_pTable.clienteId, clienteId).single();

    return Program.fromJson(response);
  }

  @override
  Future<void> addProgram(String clienteId, ProgramSheet programSheet) async {
    final row = await _getRow(clienteId);
    final newNum = (row.latestProgramNum ?? 0) + 1;
    final updatedPrograms = [
      ...row.program,
      programSheet.copyWith(number: newNum),
    ];

    await _supabase.from(_pTable.tableName).update({
      _pTable.program: updatedPrograms.map((p) => p.toJson()).toList(),
      _pTable.latestProgramNum: newNum,
    }).eq(_pTable.clienteId, clienteId);
  }

  @override
  Future<void> updateProgram(
      String clienteId,
      ProgramSheet updatedProgramSheet,
      ) async {
    final row = await _getRow(clienteId);
    final updatedPrograms = row.program
        .map((p) => p.number == updatedProgramSheet.number ? updatedProgramSheet : p)
        .toList();

    await _supabase.from(_pTable.tableName).update({
      _pTable.program: updatedPrograms.map((p) => p.toJson()).toList(),
    }).eq(_pTable.clienteId, clienteId);
  }

  @override
  Future<void> updateProgramAsCliente(ProgramSheet updatedProgramSheet) async {
    final clienteId = _supabase.auth.currentUser?.id;
    if (clienteId == null) {
      throw Exception('Utente non loggato');
    }
    await updateProgram(clienteId, updatedProgramSheet);
  }

  @override
  Future<ProgramSheet> getProgram(String clienteId, int programNumber) async {
    final row = await _getRow(clienteId);
    return row.program.firstWhere((p) => p.number == programNumber);
  }

  @override
  Future<int> getLatestProgramNumber(String clienteId) async {
    final row = await _getRow(clienteId);
    return row.latestProgramNum ?? 0;
  }

  @override
  Future<List<ProgramSheet>> getProgramsList(String clienteId) async {
    final row = await _getRow(clienteId);
    return row.program;
  }
}