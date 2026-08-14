import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_woc/notifications/MessagingService.dart';
import 'package:flutter_woc/notifications/data/NotificationsRepository.dart';
import 'package:flutter_woc/notifications/data/model/NotificationModel.dart';

class NotificationViewModel extends ChangeNotifier with WidgetsBindingObserver {
  NotificationViewModel({NotificationsRepositoryInterface? notificationsRepository})
      : _notificationsRepository = notificationsRepository ?? NotificationsRepository.instance {
    WidgetsBinding.instance.addObserver(this);
    loadNotifications();
    _receivedSub = MessagingService.instance.onNotificationReceived.listen((_) {
      loadNotifications();
    });
  }

  final NotificationsRepositoryInterface _notificationsRepository;
  StreamSubscription? _receivedSub;

  List<NotificationModel> _notifications = List.empty();
  List<NotificationModel> get notifications => _notifications;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadNotifications();
    }
  }

  Future<void> loadNotifications() async {
    try {
      _notifications = await _notificationsRepository.getNotifications();
      notifyListeners();
    } catch (_) {
      clearNotifications();
    }
  }

  Future<void> deleteAllNotifications() async {
    try {
      await _notificationsRepository.deleteAllNotifications();
      await loadNotifications();
    } catch (_) {
      clearNotifications();
    }
  }

  void clearNotifications() {
    _notifications = List.empty();
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _receivedSub?.cancel();
    super.dispose();
  }
}