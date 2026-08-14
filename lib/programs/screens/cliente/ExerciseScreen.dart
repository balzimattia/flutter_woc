import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';
import '../../../ui/AppTheme.dart';
import '../../../ui/components/TimerComp.dart';
import '../../data/models/ProgramSheet.dart';
import '../../viewmodels/ClienteProgramViewModel.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({
    super.key,
    required this.exerciseIndex,
    required this.clienteProgramViewModel,
    required this.exercise
  });

  final int exerciseIndex;
  final ClienteProgramViewModel clienteProgramViewModel;
  final Exercise exercise;

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();
    _errorSub = widget.clienteProgramViewModel.exerciseErrorMessage.listen((message) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.clienteProgramViewModel,
      child: Consumer<ClienteProgramViewModel>(
        builder: (context, vm, _) {
          final state = vm.currentProgramState;
          final weekNumber = state.currentWeekNumber;
          final dayNumber = state.currentDayNumber;

          if (weekNumber == null || dayNumber == null) {
            return const SizedBox.shrink();
          }

          return Scaffold(
            body: _ExerciseContent(
              exercise: widget.exercise,
              onWeightUpdate: (newWeight) => vm.changeWeight(
                weekNumber,
                dayNumber,
                widget.exerciseIndex,
                newWeight,
              ),
              onCommentUpdate: (comment) => vm.updateClienteComment(
                weekNumber,
                dayNumber,
                widget.exerciseIndex,
                comment,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ExerciseContent extends StatefulWidget {
  const _ExerciseContent({
    required this.exercise,
    required this.onWeightUpdate,
    required this.onCommentUpdate,
  });

  final Exercise exercise;
  final void Function(double) onWeightUpdate;
  final void Function(String) onCommentUpdate;

  @override
  State<_ExerciseContent> createState() => _ExerciseContentState();
}

class _ExerciseContentState extends State<_ExerciseContent> {
  late int _setsRemaining;
  bool _isTimerRunning = false;
  int _timerKey = 0;

  @override
  void initState() {
    super.initState();
    _setsRemaining = widget.exercise.sets;
  }

  bool get _isCompleted => _setsRemaining <= 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Text(
              widget.exercise.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),

            _ExerciseInfoCard(
              exercise: widget.exercise,
              onWeightUpdate: widget.onWeightUpdate,
            ),

            _SetsRemainingSection(
              setsRemaining: _setsRemaining,
              isCompleted: _isCompleted,
            ),

            _TimerSection(
              restSeconds: widget.exercise.rest,
              timerKey: _timerKey,
              isRunning: _isTimerRunning,
              isCompleted: _isCompleted,
              onToggle: () => setState(() => _isTimerRunning = !_isTimerRunning),
              onFinish: () {
                setState(() {
                  _isTimerRunning = false;
                  _setsRemaining--;
                  _timerKey++;
                });
              },
            ),

            if (widget.exercise.coachComment.trim().isNotEmpty)
              _CoachCommentSection(comment: widget.exercise.coachComment),

            _ClienteCommentSection(
              comment: widget.exercise.clienteComment,
              onSaveComment: widget.onCommentUpdate,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ExerciseInfoCard extends StatelessWidget {
  const _ExerciseInfoCard({
    required this.exercise,
    required this.onWeightUpdate,
  });

  final Exercise exercise;
  final void Function(double) onWeightUpdate;

  @override
  Widget build(BuildContext context) {
    return ElevatedCardComp(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _InfoSquare(label: 'Serie', value: exercise.sets.toString()),
                _InfoSquare(label: 'Reps', value: exercise.reps.toString()),
                _InfoSquare(label: 'Rec.', value: '${exercise.rest}s'),
                _WeightSquare(
                    weight: exercise.weight, onWeightUpdate: onWeightUpdate),
              ],
            ),
          ),
        ]
    );
  }
}

class _InfoSquare extends StatelessWidget {
  const _InfoSquare({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}

class _WeightSquare extends StatefulWidget {
  const _WeightSquare({required this.weight, required this.onWeightUpdate});

  final double weight;
  final void Function(double) onWeightUpdate;

  @override
  State<_WeightSquare> createState() => _WeightSquareState();
}

class _WeightSquareState extends State<_WeightSquare> {
  bool _isEditing = false;
  late double _displayWeight;
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _displayWeight = widget.weight;
  }

  void _confirm() {
    final parsed = double.tryParse(_inputController.text);
    if (parsed != null) {
      widget.onWeightUpdate(parsed);
      setState(() {
        _displayWeight = parsed;
        _isEditing = false;
      });
    } else {
      setState(() => _isEditing = false);
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isEditing)
          SizedBox(
            width: 100,
            child: TextField(
              controller: _inputController,
              focusNode: _focusNode,
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _confirm(),
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: _confirm,
                ),
              ),
            ),
          )
        else
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                _inputController.text = '';
                setState(() => _isEditing = true);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _displayWeight == 0 ? '--' : '${_displayWeight}kg',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.edit,
                      size: 14,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        Text(
          'Peso',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}

class _SetsRemainingSection extends StatelessWidget {
  const _SetsRemainingSection({required this.setsRemaining, required this.isCompleted});

  final int setsRemaining;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Text('Serie rimanenti:', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: ScaleTransition(scale: animation, child: child)),
          child: isCompleted
              ? Container(
            key: const ValueKey('completed'),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.lightGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '✓ Completato',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          )
              : Container(
            key: const ValueKey('remaining'),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppTheme.lightGreen,
              shape: BoxShape.circle,
            ),
            child: Text(
              setsRemaining.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TimerSection extends StatelessWidget {
  const _TimerSection({
    required this.restSeconds,
    required this.timerKey,
    required this.isRunning,
    required this.isCompleted,
    required this.onToggle,
    required this.onFinish,
  });

  final int restSeconds;
  final int timerKey;
  final bool isRunning;
  final bool isCompleted;
  final VoidCallback onToggle;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        TimerComp(
          timerKey: timerKey,
          secondsRemaining: restSeconds,
          isRunning: isRunning,
          onFinish: onFinish,
          contentBuilder: (formattedTime, remaining) => TimerDisplay(
            formattedTime: formattedTime,
            remaining: remaining,
            total: restSeconds,
          ),
        ),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            onPressed: isCompleted ? null : onToggle,
            style: ElevatedButton.styleFrom(
              backgroundColor: isRunning ? Colors.red : AppTheme.lightGreen,
              foregroundColor: Colors.black,
            ),
            child: Text(isRunning ? 'Pausa' : 'Avvia Recupero', style: TextStyle(color: Colors.black),),
          ),
        ),
      ],
    );
  }
}

class _CoachCommentSection extends StatelessWidget {
  const _CoachCommentSection({required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note del coach',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            comment,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}

class _ClienteCommentSection extends StatefulWidget {
  const _ClienteCommentSection({required this.comment, required this.onSaveComment});

  final String comment;
  final void Function(String) onSaveComment;

  @override
  State<_ClienteCommentSection> createState() => _ClienteCommentSectionState();
}

class _ClienteCommentSectionState extends State<_ClienteCommentSection> {
  late final TextEditingController _controller;
  bool _isEditing = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.comment);
  }

  @override
  void didUpdateWidget(covariant _ClienteCommentSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isEditing && oldWidget.comment != widget.comment && _controller.text != widget.comment) {
      _controller.text = widget.comment;
      setState(() => _hasChanges = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note mie',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: _controller,
            onTap: () => _isEditing = true,
            onChanged: (value) {
              setState(() => _hasChanges = value != widget.comment);
            },
            minLines: 2,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Aggiungi una nota...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _hasChanges
                  ? () {
                widget.onSaveComment(_controller.text);
                _isEditing = false;
                setState(() => _hasChanges = false);
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _hasChanges ? AppTheme.lightGreen : null,
                foregroundColor: Colors.black,
              ),
              child: const Text('Salva'),
            ),
          ),
        ],
      ),
    );
  }
}