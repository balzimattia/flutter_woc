import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ui/AppTheme.dart';
import '../../../users/data/model/UserModel.dart';
import '../../viewmodels/ClienteCoachingRequestViewModel.dart';

class CoachingRequestScreen extends StatefulWidget {
  const CoachingRequestScreen({
    super.key,
    required this.coach,
    required this.onInviaClick
  });

  final VoidCallback onInviaClick;
  final UserModel coach;

  @override
  State<CoachingRequestScreen> createState() => _CoachingRequestScreenState();
}

class _CoachingRequestScreenState extends State<CoachingRequestScreen> {
  late final ClienteCoachingRequestViewModel _vm;
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();
    _vm = ClienteCoachingRequestViewModel();

    _errorSub = _vm.requestErrorMessage.listen((message) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
      child: _CoachRequestContent(
        coach: widget.coach,
        onInviaClick: () {
          _vm.addRequest(widget.coach.id);
          widget.onInviaClick();
        },
      ),
    );
  }
}

class _CoachRequestContent extends StatelessWidget {
  const _CoachRequestContent({
    required this.coach,
    required this.onInviaClick,
  });

  final UserModel coach;
  final VoidCallback onInviaClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Text(
              coach.role.toRoleString.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
            ),
            Text(
              coach.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary
              ),
            ),
            Text(
              coach.email,
              style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimary),
            ),
            ElevatedButton(
              onPressed: onInviaClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.lightGreen,
                foregroundColor: Colors.black,
                elevation: 8,
              ),
              child: const Text('INVIA RICHIESTA'),
            ),
          ],
        ),
      ),
    );
  }
}