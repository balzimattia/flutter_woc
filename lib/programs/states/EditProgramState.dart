import 'package:freezed_annotation/freezed_annotation.dart';

part 'EditProgramState.freezed.dart';

@freezed
class ExerciseState with _$ExerciseState {
  const factory ExerciseState({
    @Default('') String name,
    @Default(0) int sets,
    @Default(0) int reps,
    @Default(0) int rest,
    @Default(0.0) double weight,
    @Default('') String coachComment,
    @Default('') String clienteComment,
  }) = _ExerciseState;
}

@freezed
class DayState with _$DayState {
  const factory DayState({
    required int number,
    @Default(false) bool isCompleted,
    @Default([]) List<ExerciseState> exercises,
  }) = _DayState;
}

@freezed
class WeekState with _$WeekState {
  const factory WeekState({
    required int number,
    @Default([]) List<DayState> days,
  }) = _WeekState;
}

@freezed
class EditProgramState with _$EditProgramState {
  const factory EditProgramState({
    @Default(false) bool isLoading,
    @Default(true) bool isNewProgram,
    @Default(0) int programNumber,
    @Default([]) List<WeekState> weeks,
    @Default(false) bool saveSuccess,
  }) = _EditProgramState;
}