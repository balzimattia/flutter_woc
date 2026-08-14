import 'package:freezed_annotation/freezed_annotation.dart';

import 'ProgramSheet.dart';

part 'Program.freezed.dart';
part 'Program.g.dart';

@freezed
class Program with _$Program {
  const factory Program({
    required String coachId,
    required String clienteId,
    required List<ProgramSheet> program,
    required int? latestProgramNum
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);
}