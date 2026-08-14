import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';
import '../../auth/viewmodels/AuthViewModel.dart';
import '../../users/data/model/UserModel.dart';
import '../NotificationType.dart';
import '../NotificationViewModel.dart';
import '../data/model/NotificationModel.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
    required this.onRequestsClick,
    required this.onProgramClick,
    required this.onRequestResultClick,
  });

  final VoidCallback onRequestsClick;
  final VoidCallback onProgramClick;
  final VoidCallback onRequestResultClick;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationViewModel? _vm;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationViewModel>().loadNotifications();
    });
  }

  @override
  void dispose() {
    _vm?.deleteAllNotifications();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthViewModel>().currentUser;
    final vm = context.watch<NotificationViewModel>();
    _vm = vm;

    return Scaffold(
      body: _NotificationContent(
        role: currentUser?.role,
        notifications: vm.notifications,
        onRequestsClick: widget.onRequestsClick,
        onProgramClick: widget.onProgramClick,
        onRequestResultClick: widget.onRequestResultClick,
      ),
    );
  }
}

class _NotificationContent extends StatelessWidget {
  const _NotificationContent({
    required this.role,
    required this.notifications,
    required this.onRequestsClick,
    required this.onProgramClick,
    required this.onRequestResultClick,
  });

  final UserRole? role;
  final List<NotificationModel> notifications;
  final VoidCallback onRequestsClick;
  final VoidCallback onProgramClick;
  final VoidCallback onRequestResultClick;

  @override
  Widget build(BuildContext context) {
    if (role == null) {
      return const Center(child: Text('Esegui il login'));
    }

    return switch (role!) {
      UserRole.coach => _CoachNotifications(
        notifications: notifications,
        onRequestsClick: onRequestsClick,
      ),
      UserRole.cliente => _ClienteNotifications(
        notifications: notifications,
        onProgramClick: onProgramClick,
        onRequestResultClick: onRequestResultClick,
      ),
    };
  }
}

class _CoachNotifications extends StatelessWidget {
  const _CoachNotifications({
    required this.notifications,
    required this.onRequestsClick,
  });

  final List<NotificationModel> notifications;
  final VoidCallback onRequestsClick;

  @override
  Widget build(BuildContext context) {
    final requests = notifications
        .where((n) => n.notificationType == NotificationType.coachingRequest)
        .toList();

    if (requests.isEmpty) {
      return const Center(child: Text('Nessuna nuova richiesta'));
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        return ElevatedCardComp(
            onClick: onRequestsClick,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Nuova richiesta di coaching',
                      style: TextStyle(color: Theme
                          .of(context)
                          .colorScheme
                          .onPrimary),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary),
                ],
              ),
            ]
        );
      },
    );
  }
}

class _ClienteNotifications extends StatelessWidget {
  const _ClienteNotifications({
    required this.notifications,
    required this.onProgramClick,
    required this.onRequestResultClick,
  });

  final List<NotificationModel> notifications;
  final VoidCallback onProgramClick;
  final VoidCallback onRequestResultClick;

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const Center(child: Text('Nessuna nuova notifica'));
    }

    NotificationModel? requestResult;
    try {
      requestResult = notifications.firstWhere(
            (n) => n.notificationType == NotificationType.coachingRequestResult,
      );
    } catch (_) {
      requestResult = null;
    }

    final programNotifications = notifications
        .where((n) =>
    n.notificationType == NotificationType.newProgram ||
        n.notificationType == NotificationType.programUpdated)
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        if (requestResult != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ElevatedCardComp(
                onClick: onRequestResultClick,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _requestResultText(requestResult.isAccepted),
                          style: TextStyle(color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Theme
                          .of(context)
                          .colorScheme
                          .onPrimary),
                    ],
                  ),
                ]
            ),
          ),
        ...programNotifications.map(
              (notification) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ElevatedCardComp(
                    onClick: onProgramClick,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.notificationType == NotificationType.newProgram
                                  ? 'Hai ricevuto un nuovo programma'
                                  : 'Il tuo programma è stato modificato',
                              style: TextStyle(color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onPrimary),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary),
                        ],
                      ),
                    ]
                ),
          ),
        ),
      ],
    );
  }

  String _requestResultText(bool? isAccepted) {
    if (isAccepted == true) return 'La tua richiesta di coaching è stata accettata!';
    if (isAccepted == false) return 'La tua richiesta di coaching è stata rifiutata';
    return 'Hai ricevuto una risposta alla tua richiesta di coaching';
  }
}