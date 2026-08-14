import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'NotificationType.dart';

class NotificationChannels {
  static const coachingRequest = AndroidNotificationChannel(
    'coaching_request_channel',
    'Richieste di coaching',
    importance: Importance.high,
  );

  static const requestResult = AndroidNotificationChannel(
    'request_result_channel',
    'Esiti richieste',
    importance: Importance.high,
  );

  static const program = AndroidNotificationChannel(
    'program_channel',
    'Programmi',
    importance: Importance.high,
  );

  static List<AndroidNotificationChannel> get all =>
      [coachingRequest, requestResult, program];

  static String idFor(NotificationType type) {
    switch (type) {
      case NotificationType.coachingRequest:
        return coachingRequest.id;
      case NotificationType.coachingRequestResult:
        return requestResult.id;
      case NotificationType.newProgram:
      case NotificationType.programUpdated:
        return program.id;
      case NotificationType.generic:
        return coachingRequest.id;
    }
  }
}