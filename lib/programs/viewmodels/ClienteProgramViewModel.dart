import 'dart:async';
import 'package:flutter/foundation.dart';
import '../../auth/data/AuthRepository.dart';
import '../data/ProgramsRepository.dart';
import '../data/models/ProgramSheet.dart';
import '../states/ProgramState.dart';

class ClienteProgramViewModel extends ChangeNotifier {
  ClienteProgramViewModel({
    ClienteProgramsRepositoryInterface? programsRepository,
    AuthRepositoryInterface? authRepository,
  })  : _programsRepository = programsRepository ?? ProgramsRepository.instance,
        _authRepository = authRepository ?? AuthRepository.instance {
    loadInitialData();
  }

  final ClienteProgramsRepositoryInterface _programsRepository;
  final AuthRepositoryInterface _authRepository;

  ProgramState _currentProgramState = const ProgramState();
  ProgramState get currentProgramState => _currentProgramState;

  int _latestProgramNum = 0;
  int get latestProgramNum => _latestProgramNum;

  bool _isDayCompletedLoading = false;
  bool get isDayCompletedLoading => _isDayCompletedLoading;

  final StreamController<String> _exerciseErrorMessage = StreamController<String>.broadcast();
  Stream<String> get exerciseErrorMessage => _exerciseErrorMessage.stream;


  void _setState(ProgramState s) {
    _currentProgramState = s;
    notifyListeners();
  }


  Future<void> loadInitialData() async {
    try {
      _setState(_currentProgramState.copyWith(isLoadingScreen: true));

      final id = _authRepository.currentUser.value?.id;
      if (id == null) return;

      final n = await _programsRepository.getLatestProgramNumber(id);
      _latestProgramNum = n;

      if (n > 0) {
        final program = await _programsRepository.getProgram(id, n);
        _setState(_currentProgramState.copyWith(currentProgram: program));
      }

      _setState(_currentProgramState.copyWith(isLoadingScreen: false));
    } catch (_) {
      _setState(const ProgramState());
    }
  }

  void setCurrentDay(int weekNumber, int dayNumber) {
    _setState(_currentProgramState.copyWith(
      currentWeekNumber: weekNumber,
      currentDayNumber: dayNumber,
    ));
  }

  Future<void> getProgram(int programNumber) async {
    try {
      _setState(_currentProgramState.copyWith(isLoadingWeeks: true));

      final id = _authRepository.currentUser.value?.id;
      if (id == null) return;

      final program = await _programsRepository.getProgram(id, programNumber);

      _setState(_currentProgramState.copyWith(
        currentProgram: program,
        isLoadingWeeks: false,
      ));
    } catch (_) {
      _setState(_currentProgramState.copyWith(isLoadingWeeks: false));
    }
  }

  Day? getDay(int weekNumber, int dayNumber) {
    final weeks = _currentProgramState.currentProgram?.weeks;
    if (weeks == null) return null;

    for (final week in weeks) {
      if (week.number == weekNumber) {
        for (final day in week.days) {
          if (day.number == dayNumber) return day;
        }
      }
    }
    return null;
  }

  Day? getNextDay() {
    final weeks = _currentProgramState.currentProgram?.weeks;
    if (weeks == null) return null;

    final sortedWeeks = [...weeks]..sort((a, b) => a.number.compareTo(b.number));

    for (final week in sortedWeeks) {
      final sortedDays = [...week.days]..sort((a, b) => a.number.compareTo(b.number));
      for (final day in sortedDays) {
        if (!day.isCompleted) {
          setCurrentDay(week.number, day.number);
          return day;
        }
      }
    }
    return null;
  }

  Exercise? getExercise(int weekNumber, int dayNumber, int exerciseIndex) {
    final day = getDay(weekNumber, dayNumber);
    if (day == null || exerciseIndex >= day.exercises.length) return null;
    return day.exercises[exerciseIndex];
  }

  void updateExercise(int weekNumber, int dayNumber, int index, Exercise updated) {
    final program = _currentProgramState.currentProgram;
    if (program == null) return;

    _setState(_currentProgramState.copyWith(
      currentProgram: program.copyWith(
        weeks: program.weeks.map((week) {
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
      ),
    ));
  }

  Future<void> _updateAndSaveExercise(
      int weekNumber,
      int dayNumber,
      int exerciseIndex,
      Exercise Function(Exercise) update,
      ) async {
    final day = getDay(weekNumber, dayNumber);
    if (day == null || exerciseIndex >= day.exercises.length) return;

    final updated = update(day.exercises[exerciseIndex]);
    updateExercise(weekNumber, dayNumber, exerciseIndex, updated);

    final sheet = _currentProgramState.currentProgram;
    if (sheet == null) return;
    await _programsRepository.updateProgramAsCliente(sheet);
  }

  Future<void> changeWeight(
      int weekNumber,
      int dayNumber,
      int exerciseIndex,
      double newWeight,
      ) async {
    try {
      await _updateAndSaveExercise(
        weekNumber,
        dayNumber,
        exerciseIndex,
            (ex) => ex.copyWith(weight: newWeight),
      );
    } catch (_) {
      _exerciseErrorMessage.add('Errore durante il salvataggio del peso');
    }
  }

  Future<void> updateClienteComment(
      int weekNumber,
      int dayNumber,
      int exerciseIndex,
      String comment,
      ) async {
    try {
      await _updateAndSaveExercise(
        weekNumber,
        dayNumber,
        exerciseIndex,
            (ex) => ex.copyWith(clienteComment: comment),
      );
    } catch (_) {
      _exerciseErrorMessage.add('Errore durante il salvataggio del commento');
    }
  }

  Future<void> completeDay(int weekNumber, int dayNumber) async {
    try {
      _isDayCompletedLoading = true;
      notifyListeners();

      await _updateAndSaveDay(weekNumber, dayNumber, (day) => day.copyWith(isCompleted: true));
    } catch (_) {
    } finally {
      _isDayCompletedLoading = false;
      notifyListeners();
    }
  }

  Future<void> _updateAndSaveDay(
      int weekNumber,
      int dayNumber,
      Day Function(Day) update,
      ) async {
    final program = _currentProgramState.currentProgram;
    if (program == null) return;

    final updatedProgram = program.copyWith(
      weeks: program.weeks.map((week) {
        if (week.number != weekNumber) return week;
        return week.copyWith(
          days: week.days.map((day) {
            if (day.number != dayNumber) return day;
            return update(day);
          }).toList(),
        );
      }).toList(),
    );

    _setState(_currentProgramState.copyWith(currentProgram: updatedProgram));
    await _programsRepository.updateProgramAsCliente(updatedProgram);
  }

  @override
  void dispose() {
    _exerciseErrorMessage.close();
    super.dispose();
  }
}