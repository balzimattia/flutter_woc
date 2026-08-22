import 'dart:async';
import 'package:flutter/foundation.dart';

import '../data/ProgramsRepository.dart';
import '../data/models/ProgramSheet.dart';
import '../states/EditProgramState.dart';


class EditProgramViewModel extends ChangeNotifier {
  EditProgramViewModel({CoachProgramsRepositoryInterface? programsRepository})
      : _programsRepository = programsRepository ?? ProgramsRepository.instance;

  final CoachProgramsRepositoryInterface _programsRepository;

  EditProgramState _state = const EditProgramState();
  EditProgramState get state => _state;

  final StreamController<String> _editErrorMessage = StreamController<String>.broadcast();
  Stream<String> get editErrorMessage => _editErrorMessage.stream;

  bool _initialized = false;

  void _setState(EditProgramState s) {
    _state = s;
    notifyListeners();
  }

  Future<void> init(String clienteId, int? programNumber) async {
    if (_initialized) return;
    _initialized = true;

    if (programNumber == null) {
      _setState(const EditProgramState(isNewProgram: true, weeks: []));
    } else {
      await _loadExisting(clienteId, programNumber);
    }
  }

  Future<void> _loadExisting(String clienteId, int programNumber) async {
    _setState(_state.copyWith(isLoading: true));
    try {
      final sheet = await _programsRepository.getProgram(clienteId, programNumber);
      _setState(_state.copyWith(
        isLoading: false,
        isNewProgram: false,
        programNumber: programNumber,
        weeks: sheet.weeks
            .map((week) => WeekState(
          number: week.number,
          days: week.days
              .map((day) => DayState(
            number: day.number,
            isCompleted: day.isCompleted,
            exercises: day.exercises.map((ex) => ex.toUiState()).toList(),
          ))
              .toList(),
        ))
            .toList(),
      ));
    } catch (e) {
      _setState(_state.copyWith(isLoading: false));
      _editErrorMessage.add('Qualcosa è andato storto');
    }
  }

  void addWeek() {
    final nextNum = _state.weeks.isEmpty
        ? 1
        : _state.weeks.map((w) => w.number).reduce((a, b) => a > b ? a : b) + 1;
    _setState(_state.copyWith(
      weeks: [..._state.weeks, WeekState(number: nextNum)],
    ));
  }

  void removeWeek(int weekNumber) {
    _setState(_state.copyWith(
      weeks: _state.weeks.where((w) => w.number != weekNumber).toList(),
    ));
  }

  void addDay(int weekNumber) {
    _setState(_state.copyWith(
      weeks: _state.weeks.map((week) {
        if (week.number != weekNumber) return week;
        final nextNum = week.days.isEmpty
            ? 1
            : week.days.map((d) => d.number).reduce((a, b) => a > b ? a : b) + 1;
        return week.copyWith(
          days: [...week.days, DayState(number: nextNum, isCompleted: false)],
        );
      }).toList(),
    ));
  }

  void removeDay(int weekNumber, int dayNumber) {
    _setState(_state.copyWith(
      weeks: _state.weeks.map((week) {
        if (week.number != weekNumber) return week;
        return week.copyWith(
          days: week.days.where((d) => d.number != dayNumber).toList(),
        );
      }).toList(),
    ));
  }

  void addExercise(int weekNumber, int dayNumber) {
    _setState(_state.copyWith(
      weeks: _state.weeks.map((week) {
        if (week.number != weekNumber) return week;
        return week.copyWith(
          days: week.days.map((day) {
            if (day.number != dayNumber) return day;
            return day.copyWith(
              exercises: [...day.exercises, const ExerciseState()],
            );
          }).toList(),
        );
      }).toList(),
    ));
  }

  void updateExercise(int weekNumber, int dayNumber, int index, ExerciseState updated) {
    _setState(_state.copyWith(
      weeks: _state.weeks.map((week) {
        if (week.number != weekNumber) return week;
        return week.copyWith(
          days: week.days.map((day) {
            if (day.number != dayNumber) return day;
            final newExercises = [...day.exercises];
            newExercises[index] = updated;
            return day.copyWith(exercises: newExercises);
          }).toList(),
        );
      }).toList(),
    ));
  }

  void removeExercise(int weekNumber, int dayNumber, int index) {
    _setState(_state.copyWith(
      weeks: _state.weeks.map((week) {
        if (week.number != weekNumber) return week;
        return week.copyWith(
          days: week.days.map((day) {
            if (day.number != dayNumber) return day;
            final newExercises = [...day.exercises]..removeAt(index);
            return day.copyWith(exercises: newExercises);
          }).toList(),
        );
      }).toList(),
    ));
  }

  Future<void> saveProgram(String clienteId) async {
    _setState(_state.copyWith(isLoading: true));
    try {
      if (_state.isNewProgram) {
        final sheet = _state.toProgramSheet().copyWith(number: 0);
        await _programsRepository.addProgram(clienteId, sheet);
      } else {
        final sheet = _state.toProgramSheet();
        await _programsRepository.updateProgram(clienteId, sheet);
      }
      _setState(_state.copyWith(isLoading: false, saveSuccess: true));
    } catch (_) {
      _setState(_state.copyWith(isLoading: false));
      _editErrorMessage.add('Errore durante il salvataggio');
    }
  }

  @override
  void dispose() {
    _editErrorMessage.close();
    super.dispose();
  }
}


extension on Exercise {
  ExerciseState toUiState() => ExerciseState(
    name: name,
    sets: sets,
    reps: reps,
    rest: rest,
    weight: weight,
    coachComment: coachComment,
    clienteComment: clienteComment,
  );
}

extension on ExerciseState {
  Exercise toDomain() => Exercise(
    name: name,
    sets: sets,
    reps: reps,
    rest: rest,
    weight: weight,
    coachComment: coachComment,
    clienteComment: clienteComment,
  );
}

extension on EditProgramState {
  ProgramSheet toProgramSheet() => ProgramSheet(
    number: programNumber,
    weeks: weeks
        .map((week) => Week(
      number: week.number,
      days: week.days
          .map((day) => Day(
        number: day.number,
        isCompleted: day.isCompleted,
        exercises: day.exercises.map((e) => e.toDomain()).toList(),
      ))
          .toList(),
    ))
        .toList(),
  );
}