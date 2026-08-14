import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_woc/supabase/Tables.dart';
import 'package:flutter_woc/users/data/model/UsersDevicesToken.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../device/DeviceHelper.dart';
import '../firebase_options.dart';
import 'NotificationChannels.dart';
import 'NotificationPreferencesStore.dart';
import 'NotificationType.dart';

final FlutterLocalNotificationsPlugin _localNotifications =
FlutterLocalNotificationsPlugin();

bool _localNotifInitialized = false;

@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _ensureLocalNotificationsInitialized();
  await _showLocalNotificationFromData(message.data);
}

class MessagingService {
  MessagingService._internal();
  static final MessagingService instance = MessagingService._internal();

  final _msgService = FirebaseMessaging.instance;

  final _notificationReceivedController = StreamController<void>.broadcast();
  Stream<void> get onNotificationReceived => _notificationReceivedController.stream;

  bool _initialized = false;

  Future<void> initFCM() async {
    if (_initialized) return;
    _initialized = true;

    await _msgService.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    await _ensureLocalNotificationsInitialized();

    final token = await _msgService.getToken();
    if (token != null) await _saveTokenToSupabase(token);
    _msgService.onTokenRefresh.listen(_saveTokenToSupabase);

    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) async {
      await _showLocalNotificationFromData(message.data);
      _notificationReceivedController.add(null);
    });
  }

  Future<void> _saveTokenToSupabase(String token) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return;

    final deviceId = await DeviceHelper.instance.getDeviceId();

    final udtTable = Tables.usersDevicesToken;
    final UsersDevicesToken udt = UsersDevicesToken(userId: userId, deviceId: deviceId, fcmToken: token) ;
    await Supabase.instance.client.from(udtTable.tableName).upsert(udt);
  }

  void dispose() {
    _notificationReceivedController.close();
  }
}

Future<void> _ensureLocalNotificationsInitialized() async {
  if (_localNotifInitialized) return;

  const androidSettings = AndroidInitializationSettings('@drawable/ic_noti');
  const iosSettings = DarwinInitializationSettings();

  await _localNotifications.initialize(
    const InitializationSettings(android: androidSettings, iOS: iosSettings),
  );

  final androidImpl = _localNotifications
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  for (final channel in NotificationChannels.all) {
    await androidImpl?.createNotificationChannel(channel);
  }

  _localNotifInitialized = true;
}

Future<void> _showLocalNotificationFromData(Map<String, dynamic> data) async {
  final title = data['title'] as String?;
  final body = data['body'] as String?;
  if (title == null || body == null) return;

  final type = NotificationType.fromString(data['type'] as String?);

  final store = NotificationPreferencesStore.instance;
  final enabled = await store.isEnabled(type);
  if (!enabled) return;

  await _localNotifications.show(
    Random().nextInt(1 << 31),
    title,
    body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        NotificationChannels.idFor(type),
        NotificationChannels.idFor(type),
        icon: '@drawable/ic_noti',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: const DarwinNotificationDetails(),
    ),
    payload: jsonEncode(data),
  );
}