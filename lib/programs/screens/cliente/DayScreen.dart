import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';

import '../../../ui/AppTheme.dart';
import '../../data/models/ProgramSheet.dart';
import '../../viewmodels/ClienteProgramViewModel.dart';

class DayScreen extends StatefulWidget {
  const DayScreen({
    super.key,
    required this.clienteProgramViewModel,
    required this.onExerciseClick,
  });

  final ClienteProgramViewModel clienteProgramViewModel;
  final void Function(int exerciseIndex) onExerciseClick;

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initState());
  }

  Future<void> _initState() async {
    final vm = widget.clienteProgramViewModel;
    if (vm.currentProgramState.currentProgram == null) {
      await vm.loadInitialData();
    }
    final state = vm.currentProgramState;
    if (state.currentWeekNumber == null || state.currentDayNumber == null) {
      vm.getNextDay();
    }
    if (mounted) {
      setState(() => _initialized = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.clienteProgramViewModel,
      child: Consumer<ClienteProgramViewModel>(
        builder: (context, vm, _) {
          final state = vm.currentProgramState;

          if (state.isLoadingScreen || !_initialized) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final weekNumber = state.currentWeekNumber;
          final dayNumber = state.currentDayNumber;

          if (weekNumber == null || dayNumber == null) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Giorno non disponibile',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            );
          }

          final day = vm.getDay(weekNumber, dayNumber);

          if (day == null) {
            return Scaffold(
              body: Center(
                child: Text('Giorno non disponibile', style: TextStyle(fontSize: 26, color: Theme.of(context).colorScheme.onPrimary)),
              ),
            );
          }

          return Scaffold(
            body: _DayContent(
              day: day,
              isDayCompletedLoading: vm.isDayCompletedLoading,
              onExerciseClick: widget.onExerciseClick,
              onCompleteDay: () => vm.completeDay(weekNumber, dayNumber),
            ),
          );
        },
      ),
    );
  }
}

class _DayContent extends StatefulWidget {
  const _DayContent({
    required this.day,
    required this.isDayCompletedLoading,
    required this.onExerciseClick,
    required this.onCompleteDay,
  });

  final Day day;
  final bool isDayCompletedLoading;
  final void Function(int exerciseIndex) onExerciseClick;
  final VoidCallback onCompleteDay;

  @override
  State<_DayContent> createState() => _DayContentState();
}

class _DayContentState extends State<_DayContent> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = null),
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ElevatedButton(
                  onPressed: widget.day.isCompleted ? null : widget.onCompleteDay,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.day.isCompleted
                        ? Theme.of(context).disabledColor
                        : AppTheme.lightGreen,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: widget.isDayCompletedLoading
                      ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        widget.day.isCompleted ? Icons.check : Icons.check_circle,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.day.isCompleted
                            ? 'Giorno completato'
                            : 'Segna come completato',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ...widget.day.exercises.asMap().entries.map((entry) {
                final index = entry.key;
                final exercise = entry.value;
                final isSelected = _selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedCardComp(
                      isSelected: isSelected,
                      onClick: () =>
                          setState(() {
                            _selectedIndex = isSelected ? null : index;
                          }),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${exercise.name} - ${exercise.sets}x${exercise
                                    .reps} '
                                    'rest: ${exercise.rest}s peso: ${exercise
                                    .weight}kg',
                                style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .onPrimary,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onPrimary,
                            ),
                          ],
                        ),
                      ]
                  ),
                );
              }),
            ],
          ),

          Positioned(
            bottom: 16,
            right: 16,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: _selectedIndex != null
                  ? FloatingActionButton(
                key: const ValueKey('fab-visible'),
                onPressed: () {
                  if (_selectedIndex != null) {
                    widget.onExerciseClick(_selectedIndex!);
                  }
                },
                backgroundColor: AppTheme.greenAcceso,
                child: const Icon(Icons.play_arrow, color: Colors.black),
              )
                  : const SizedBox.shrink(key: ValueKey('fab-hidden')),
            ),
          ),
        ],
      ),
    );
  }
}