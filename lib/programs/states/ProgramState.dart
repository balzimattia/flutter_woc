import 'package:flutter_woc/programs/data/models/ProgramSheet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProgramState.freezed.dart';

@freezed
class ProgramState with _$ProgramState {
  const factory ProgramState({
    @Default(null) ProgramSheet? currentProgram,
    @Default(null) int? currentWeekNumber,
    @Default(null) int? currentDayNumber,
    @Default(false) bool isLoadingScreen,
    @Default(false) bool isLoadingWeeks
  }) = _ProgramState;
}