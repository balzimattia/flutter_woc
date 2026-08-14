import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/AppTheme.dart';
import '../../../ui/components/ElevatedCardComp.dart';
import '../../../users/data/model/UserModel.dart';
import '../../viewmodels/ClienteCoachingRelationViewModel.dart';

class OwnCoachRelationScreen extends StatefulWidget {
  const OwnCoachRelationScreen({
    super.key,
    required this.coachingRelationViewModel,
    required this.onRemoveRelationClick
  });

  final ClienteCoachingRelationViewModel coachingRelationViewModel;
  final VoidCallback onRemoveRelationClick;

  @override
  State<OwnCoachRelationScreen> createState() => _OwnCoachRelationScreenState();
}

class _OwnCoachRelationScreenState extends State<OwnCoachRelationScreen> {
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();

    _errorSub = widget.coachingRelationViewModel.errorMessage.listen((message) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });

    widget.coachingRelationViewModel.addListener(_checkOwnCoachRemoved);
  }

  void _checkOwnCoachRemoved() {
    final state = widget.coachingRelationViewModel.ownCoachState;
    if (!state.isLoading && state.ownCoach == null) {
      widget.onRemoveRelationClick();
    }
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    widget.coachingRelationViewModel.removeListener(_checkOwnCoachRemoved);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.coachingRelationViewModel,
      child: Consumer<ClienteCoachingRelationViewModel>(
        builder: (context, vm, _) {
          final ownCoach = vm.ownCoachState.ownCoach;

          if (ownCoach == null) {
            return const SizedBox.shrink();
          }

          return Scaffold(
            body: _OwnCoachRelationContent(
              ownCoach: ownCoach,
              onRemoveRelationClick: () => vm.removeCoachingRelation()
            ),
          );
        },
      ),
    );
  }
}

class _OwnCoachRelationContent extends StatefulWidget {
  const _OwnCoachRelationContent({
    required this.ownCoach,
    required this.onRemoveRelationClick
  });

  final UserModel ownCoach;
  final VoidCallback onRemoveRelationClick;

  @override
  State<_OwnCoachRelationContent> createState() => _OwnCoachRelationContentState();
}

class _OwnCoachRelationContentState extends State<_OwnCoachRelationContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedCardComp(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 15,
              children: [
                Text(
                  widget.ownCoach.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.ownCoach.email,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _showConfirmDialog(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Text('Termina coaching'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Termina coaching', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        content: Text(
          'Sei sicuro di voler terminare il coaching con ${widget.ownCoach.name}?',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Annulla', style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () => {
              Navigator.of(dialogContext).pop(),
              widget.onRemoveRelationClick()
            },
            style: TextButton.styleFrom(backgroundColor: AppTheme.lightGreen),
            child: const Text('Conferma', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}