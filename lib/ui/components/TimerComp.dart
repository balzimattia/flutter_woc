import 'dart:async';
import 'package:flutter/material.dart';

class TimerComp extends StatefulWidget {
  const TimerComp({
    super.key,
    required this.timerKey,
    this.secondsRemaining = 0,
    this.threshold = 0,
    this.isRunning = false,
    this.onTick,
    this.onFinish,
    required this.contentBuilder,
  });

  final int timerKey;
  final int secondsRemaining;
  final int threshold;
  final bool isRunning;
  final void Function(int)? onTick;
  final VoidCallback? onFinish;
  final Widget Function(String formattedTime, int remaining) contentBuilder;

  @override
  State<TimerComp> createState() => _TimerCompState();
}

class _TimerCompState extends State<TimerComp> {
  late String _formattedTime;
  late int _remaining;
  Timer? _timer;
  DateTime? _startTime;
  int _startFrom = 0;

  @override
  void initState() {
    super.initState();
    _remaining = widget.secondsRemaining;
    _formattedTime = formatTime(widget.secondsRemaining);
    if (widget.isRunning) _startTimer();
  }

  @override
  void didUpdateWidget(covariant TimerComp oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.timerKey != widget.timerKey) {
      _timer?.cancel();
      _remaining = widget.secondsRemaining;
      _formattedTime = formatTime(widget.secondsRemaining);
      if (widget.isRunning) _startTimer();
    } else if (oldWidget.isRunning != widget.isRunning) {
      if (widget.isRunning) {
        _startTimer();
      } else {
        _timer?.cancel();
      }
    }
  }

  void _startTimer() {
    _startFrom = _remaining; // riprende da dove era rimasto
    _startTime = DateTime.now();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final elapsed = DateTime.now().difference(_startTime!);
      final remainingSeconds = _startFrom - (elapsed.inMilliseconds ~/ 1000);

      setState(() {
        _remaining = remainingSeconds;
        _formattedTime = formatTime(remainingSeconds);
      });

      if (remainingSeconds <= widget.threshold) {
        timer.cancel();
        widget.onFinish?.call();
      } else {
        widget.onTick?.call(remainingSeconds);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.contentBuilder(_formattedTime, _remaining);
  }
}


class TimerDisplay extends StatelessWidget {
  const TimerDisplay({
    super.key,
    required this.formattedTime,
    required this.remaining,
    required this.total,
  });

  final String formattedTime;
  final int remaining;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          formattedTime,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: (remaining <= 10 && remaining > 0)
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        if (total > 0)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (remaining / total).clamp(0.0, 1.0),
                minHeight: 6,
                color: Colors.lightBlue,
              ),
            ),
          ),
      ],
    );
  }
}



String formatTime(int seconds) {
  final s = seconds < 0 ? 0 : seconds;
  final m = s ~/ 60;
  final sec = s % 60;
  return '${m.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
}