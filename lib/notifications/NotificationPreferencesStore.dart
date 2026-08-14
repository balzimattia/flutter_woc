import '../device/PreferencesStore.dart';
import 'NotificationType.dart';

class NotificationPreferencesStore {
  NotificationPreferencesStore([PreferencesStore? store])
      : _store = store ?? PreferencesStore.instance;

  static final NotificationPreferencesStore instance = NotificationPreferencesStore();

  final PreferencesStore _store;

  static const _coachingRequestKey = 'coaching_request_enabled';
  static const _requestResultKey = 'request_result_enabled';
  static const _programKey = 'program_enabled';

  String _keyFor(NotificationType type) {
    switch (type) {
      case NotificationType.coachingRequest:
        return _coachingRequestKey;
      case NotificationType.coachingRequestResult:
        return _requestResultKey;
      case NotificationType.newProgram:
      case NotificationType.programUpdated:
        return _programKey;
      case NotificationType.generic:
        return _coachingRequestKey;
    }
  }

  Future<bool> isEnabled(NotificationType type) {
    if (type == NotificationType.generic) return Future.value(true);
    return _store.getBool(_keyFor(type));
  }

  Future<void> setEnabled(NotificationType type, bool enabled) {
    if (type == NotificationType.generic) return Future.value();
    return _store.setBool(_keyFor(type), enabled);
  }

  Future<Map<NotificationType, bool>> getAll() async {
    return {
      NotificationType.coachingRequest: await isEnabled(NotificationType.coachingRequest),
      NotificationType.coachingRequestResult: await isEnabled(NotificationType.coachingRequestResult),
      NotificationType.newProgram: await isEnabled(NotificationType.newProgram),
    };
  }
}