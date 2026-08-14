import 'dart:async';
import 'package:flutter/material.dart';

import '../../../ui/AppTheme.dart';
import '../../../users/data/model/UserModel.dart';
import '../../viewmodels/CoachCoachingRequestViewModel.dart';

class ClienteRequestScreen extends StatefulWidget {
  const ClienteRequestScreen({
    super.key,
    required this.coachingRequestViewModel,
    required this.cliente,
    required this.onButtonClick,
  });

  final CoachCoachingRequestViewModel coachingRequestViewModel;
  final UserModel cliente;
  final VoidCallback onButtonClick;

  @override
  State<ClienteRequestScreen> createState() => _ClienteRequestScreenState();
}

class _ClienteRequestScreenState extends State<ClienteRequestScreen> {
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();

    _errorSub = widget.coachingRequestViewModel.errorMessage.listen((message) {
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
    final vm = widget.coachingRequestViewModel;

    return Scaffold(
      body: _ClientRequestContent(
        cliente: widget.cliente,
        onAcceptClick: () {
          vm.updateRequest(true, widget.cliente.id);
          widget.onButtonClick();
        },
        onRejectClick: () {
          vm.updateRequest(false, widget.cliente.id);
          widget.onButtonClick();
        },
      ),
    );
  }
}

class _ClientRequestContent extends StatelessWidget {
  const _ClientRequestContent({
    required this.cliente,
    required this.onAcceptClick,
    required this.onRejectClick,
  });

  final UserModel cliente;
  final VoidCallback onAcceptClick;
  final VoidCallback onRejectClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 15,
        children: [
          Text(
            cliente.name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
          ),
          Text(
            cliente.email,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onPrimary),
          ),
          ElevatedButton(
            onPressed: onAcceptClick,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: AppTheme.lightGreen,
            ),
            child: const Text('Accetta'),
          ),
          ElevatedButton(
            onPressed: onRejectClick,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.red,
            ),
            child: const Text('Rifiuta'),
          ),
        ],
      ),
    );
  }
}