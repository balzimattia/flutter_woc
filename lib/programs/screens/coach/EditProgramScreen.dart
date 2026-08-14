import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';
import '../../../ui/AppTheme.dart';
import '../../data/models/ProgramSheet.dart';
import '../../states/EditProgramState.dart';
import '../../viewmodels/CoachProgramViewModel.dart';
import '../../viewmodels/EditProgramViewModel.dart';

class EditProgramScreen extends StatefulWidget {
  const EditProgramScreen({
    super.key,
    required this.clienteId,
    required this.program,
    required this.coachProgramViewModel,
    required this.onSaveSuccess,
  });

  final String clienteId;
  final ProgramSheet? program;
  final CoachProgramViewModel coachProgramViewModel;
  final VoidCallback onSaveSuccess;

  @override
  State<EditProgramScreen> createState() => _EditProgramScreenState();
}

class _EditProgramScreenState extends State<EditProgramScreen> {
  late final EditProgramViewModel _vm;
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();
    _vm = EditProgramViewModel();
    _vm.init(widget.clienteId, widget.program?.number);

    _vm.addListener(_onStateChanged);

    _errorSub = _vm.editErrorMessage.listen((message) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  void _onStateChanged() {
    if (_vm.state.saveSuccess) {
      widget.coachProgramViewModel.getClienteProgramsList(widget.clienteId, refresh: true);
      widget.onSaveSuccess();
    }
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    _vm.removeListener(_onStateChanged);
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: Consumer<EditProgramViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            body: _EditProgramContent(state: vm.state, vm: vm),
            floatingActionButton: FloatingActionButton(
              onPressed: () => vm.saveProgram(widget.clienteId),
              backgroundColor: AppTheme.lightGreen,
              foregroundColor: Colors.black,
              child: const Icon(Icons.save),
            ),
          );
        },
      ),
    );
  }
}

class _EditProgramContent extends StatefulWidget {
  const _EditProgramContent({required this.state, required this.vm});

  final EditProgramState state;
  final EditProgramViewModel vm;

  @override
  State<_EditProgramContent> createState() => _EditProgramContentState();
}

class _EditProgramContentState extends State<_EditProgramContent> {
  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final vm = widget.vm;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  state.isNewProgram
                      ? 'Nuovo Programma'
                      : 'Programma N. ${state.programNumber}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          ...state.weeks.map(
                (week) => Padding(
              key: ValueKey('week_${week.number}'),
              padding: const EdgeInsets.only(bottom: 12),
              child: _WeekCard(
                week: week,
                onRemoveWeek: () => vm.removeWeek(week.number),
                onAddDay: () => vm.addDay(week.number),
                onRemoveDay: (dayNum) => vm.removeDay(week.number, dayNum),
                onAddExercise: (dayNum) => vm.addExercise(week.number, dayNum),
                onRemoveExercise: (dayNum, idx) =>
                    vm.removeExercise(week.number, dayNum, idx),
                onUpdateExercise: (dayNum, idx, ex) =>
                    vm.updateExercise(week.number, dayNum, idx, ex),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
            child: OutlinedButton.icon(
              onPressed: vm.addWeek,
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary,),
              label: Text('Aggiungi Settimana', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekCard extends StatefulWidget {
  const _WeekCard({
    super.key,
    required this.week,
    required this.onRemoveWeek,
    required this.onAddDay,
    required this.onRemoveDay,
    required this.onAddExercise,
    required this.onRemoveExercise,
    required this.onUpdateExercise,
  });

  final WeekState week;
  final VoidCallback onRemoveWeek;
  final VoidCallback onAddDay;
  final void Function(int dayNumber) onRemoveDay;
  final void Function(int dayNumber) onAddExercise;
  final void Function(int dayNumber, int index) onRemoveExercise;
  final void Function(int dayNumber, int index, ExerciseState ex) onUpdateExercise;

  @override
  State<_WeekCard> createState() => _WeekCardState();
}

class _WeekCardState extends State<_WeekCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedCardComp(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Settimana ${widget.week.number}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => _expanded = !_expanded),
                    icon: Icon(
                      _expanded ? Icons.keyboard_arrow_up : Icons
                          .keyboard_arrow_down,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onRemoveWeek,
                    icon: Icon(Icons.delete, color: Theme
                        .of(context)
                        .colorScheme
                        .error),
                  ),
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: _expanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Divider(height: 24),
                    ...widget.week.days.map(
                          (day) =>
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _DayCard(
                              day: day,
                              onRemoveDay: () => widget.onRemoveDay(day.number),
                              onAddExercise: () =>
                                  widget.onAddExercise(day.number),
                              onRemoveExercise: (idx) =>
                                  widget.onRemoveExercise(day.number, idx),
                              onUpdateExercise: (idx, ex) =>
                                  widget.onUpdateExercise(day.number, idx, ex),
                            ),
                          ),
                    ),
                    TextButton.icon(
                      onPressed: widget.onAddDay,
                      icon: const Icon(Icons.add, color: Colors.blue),
                      label: const Text('Aggiungi Giorno',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
                secondChild: const SizedBox.shrink(),
              ),
            ],
          ),
        ]
    );
  }
}

class _DayCard extends StatefulWidget {
  const _DayCard({
    required this.day,
    required this.onRemoveDay,
    required this.onAddExercise,
    required this.onRemoveExercise,
    required this.onUpdateExercise,
  });

  final DayState day;
  final VoidCallback onRemoveDay;
  final VoidCallback onAddExercise;
  final void Function(int index) onRemoveExercise;
  final void Function(int index, ExerciseState ex) onUpdateExercise;

  @override
  State<_DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<_DayCard> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Giorno ${widget.day.number}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _expanded = !_expanded),
                  icon: Icon(
                    _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                IconButton(
                  onPressed: widget.onRemoveDay,
                  icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              crossFadeState: _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Divider(height: 24),
                  ...widget.day.exercises.asMap().entries.map(
                        (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: _ExerciseRow(
                        index: entry.key,
                        exercise: entry.value,
                        onRemove: () => widget.onRemoveExercise(entry.key),
                        onUpdate: (updated) => widget.onUpdateExercise(entry.key, updated),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: widget.onAddExercise,
                    icon: const Icon(Icons.add, color: Colors.blue),
                    label: const Text('Aggiungi Esercizio', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseRow extends StatefulWidget {
  const _ExerciseRow({
    required this.index,
    required this.exercise,
    required this.onRemove,
    required this.onUpdate,
  });

  final int index;
  final ExerciseState exercise;
  final VoidCallback onRemove;
  final void Function(ExerciseState updated) onUpdate;

  @override
  State<_ExerciseRow> createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<_ExerciseRow> {
  bool _expanded = false;

  late final TextEditingController _nameController;
  late final TextEditingController _coachCommentController;
  late final TextEditingController _clienteCommentController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.exercise.name);
    _coachCommentController = TextEditingController(text: widget.exercise.coachComment);
    _clienteCommentController = TextEditingController(text: widget.exercise.clienteComment);
  }

  @override
  void didUpdateWidget(covariant _ExerciseRow oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.exercise.name != widget.exercise.name &&
        _nameController.text != widget.exercise.name) {
      _nameController.text = widget.exercise.name;
    }
    if (oldWidget.exercise.coachComment != widget.exercise.coachComment &&
        _coachCommentController.text != widget.exercise.coachComment) {
      _coachCommentController.text = widget.exercise.coachComment;
    }
    if (oldWidget.exercise.clienteComment != widget.exercise.clienteComment &&
        _clienteCommentController.text != widget.exercise.clienteComment) {
      _clienteCommentController.text = widget.exercise.clienteComment;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _coachCommentController.dispose();
    _clienteCommentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = widget.exercise;

    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    onChanged: (value) => widget.onUpdate(exercise.copyWith(name: value)),
                    decoration: InputDecoration(
                      labelText: 'Esercizio ${widget.index + 1}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _expanded = !_expanded),
                  icon: Icon(
                    _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                IconButton(
                  onPressed: widget.onRemove,
                  icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              crossFadeState: _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: _ExerciseNumberField(
                            label: 'Sets',
                            value: exercise.sets.toString(),
                            onValueChange: (v) => widget.onUpdate(
                              exercise.copyWith(sets: int.tryParse(v) ?? 0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: _ExerciseNumberField(
                            label: 'Reps',
                            value: exercise.reps.toString(),
                            onValueChange: (v) => widget.onUpdate(
                              exercise.copyWith(reps: int.tryParse(v) ?? 0),
                            ),
                          ),
                        ),
                        ]
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: _ExerciseNumberField(
                            label: 'Rest(s)',
                            value: exercise.rest.toString(),
                            onValueChange: (v) => widget.onUpdate(
                              exercise.copyWith(rest: int.tryParse(v) ?? 0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: _ExerciseNumberField(
                            label: 'Kg',
                            value: exercise.weight.toString(),
                            onValueChange: (v) => widget.onUpdate(
                              exercise.copyWith(weight: double.tryParse(v) ?? 0.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _coachCommentController,
                      onChanged: (value) =>
                          widget.onUpdate(exercise.copyWith(coachComment: value)),
                      minLines: 2,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Note coach',
                        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    TextField(
                      readOnly: true,
                      controller: _clienteCommentController,
                      minLines: 2,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Note cliente',
                        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseNumberField extends StatefulWidget {
  const _ExerciseNumberField({
    required this.label,
    required this.value,
    required this.onValueChange,
  });

  final String label;
  final String value;
  final void Function(String) onValueChange;

  @override
  State<_ExerciseNumberField> createState() => _ExerciseNumberFieldState();
}

class _ExerciseNumberFieldState extends State<_ExerciseNumberField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant _ExerciseNumberField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value &&
        _controller.text != widget.value &&
        !_focusNode.hasFocus) {
      _controller.text = widget.value;
    }
  }

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: widget.onValueChange,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      ),
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}