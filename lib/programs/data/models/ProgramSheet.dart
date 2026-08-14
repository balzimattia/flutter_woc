import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProgramSheet.freezed.dart';
part 'ProgramSheet.g.dart';

@freezed
class ProgramSheet with _$ProgramSheet {
  const factory ProgramSheet({
    required int number,
    required List<Week> weeks,
  }) = _ProgramSheet;

  factory ProgramSheet.fromJson(Map<String, dynamic> json) =>
      _$ProgramSheetFromJson(json);
}


@freezed
class Week with _$Week {
  const factory Week({
    required int number,
    required List<Day> days,
  }) = _Week;

  factory Week.fromJson(Map<String, dynamic> json) => _$WeekFromJson(json);
}


@freezed
class Day with _$Day {
  const factory Day({
    required int number,
    required bool isCompleted,
    required List<Exercise> exercises,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}


@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required String name,
    required int sets,
    required int reps,
    required int rest, // in secondi
    required double weight,
    required String coachComment,
    required String clienteComment,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}