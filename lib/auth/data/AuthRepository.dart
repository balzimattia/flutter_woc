import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_woc/device/DeviceHelper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:flutter/foundation.dart';
import '../../supabase/Tables.dart';
import '../../users/data/model/UsersDevicesToken.dart';

abstract interface class AuthRepositoryInterface {
  ValueListenable<UserModel?> get currentUser;
  Future<void> login(String email, String password);
  Future<void> register(String email, String password, String name, UserRole role);
  Future<void> logout();
  Future<void> updatePassword(String newPassword);
}

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository._() {
    _supabase.auth.onAuthStateChange.listen((data) async {
      if (data.session == null) {
        _currentUser.value = null;
        return;
      }

      if(!_registerFlag) {
        try {
          _currentUser.value = await _getUserDb();
        } catch (_) {
          _currentUser.value = null;
          await logout();
        }
      }
    });
  }

  static final AuthRepository instance = AuthRepository._();

  final SupabaseClient _supabase = Supabase.instance.client;

  final ValueNotifier<UserModel?> _currentUser = ValueNotifier(null);

  bool _registerFlag = false;


  @override
  ValueListenable<UserModel?> get currentUser => _currentUser;

  @override
  Future<void> login(String email, String password) async {
    await _supabase.auth.signInWithPassword(
        email: email,
        password: password
    );

    final String id = await _getCurrentUserId();
    final String? token = await _retrieveFcmToken();
    final String deviceId = await DeviceHelper.instance.getDeviceId();
    _addFcmToken(id, deviceId, token);

    _currentUser.value = await _getUserDb();
  }


  @override
  Future<void> logout() async {
    final String? token = await _retrieveFcmToken();
    final deviceId = await DeviceHelper.instance.getDeviceId();

    try {
      await _removeFcmToken(deviceId, token);
    } catch(e) {}

    await _supabase.auth.signOut();
    _currentUser.value = null;
  }


  @override
  Future<void> register(String email, String password, String name, UserRole role) async {
    _registerFlag = true;

    try {
      final AuthResponse authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final userId = authResponse.user?.id ??
          (throw Exception('Errore registrazione'));

      final user = UserModel(
        id: userId,
        email: email,
        name: name,
        role: role,
      );

      final String deviceId = await DeviceHelper.instance.getDeviceId();
      final String? token = await _retrieveFcmToken();

      final usersDevicesToken = UsersDevicesToken(
        userId: userId,
        deviceId: deviceId,
        fcmToken: token,
      );

      await _supabase.from(Tables.users.tableName).insert(user);
      await _supabase.from(Tables.usersDevicesToken.tableName).upsert(
          usersDevicesToken);

      _currentUser.value = user;
    } finally {
      _registerFlag = false;
    }
  }


  @override
  Future<void> updatePassword(String newPassword) async {
    if(_supabase.auth.currentUser != null) {
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    }
  }


  Future<UserModel> _getUserDb() async {
    final String id = await _getCurrentUserId();
    final users = Tables.users;
    final response = await _supabase.from(users.tableName).select().eq(users.id, id);
    return response.map((u) => UserModel.fromJson(u)).single;
  }

  Future<String> _getCurrentUserId() async {
    return _supabase.auth.currentUser?.id ?? (throw Exception('Utente non loggato'));
  }


  Future<String?> _retrieveFcmToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch(e) {
      return null;
    }
  }

  Future<void> _addFcmToken(String userId, String deviceId, String? token) async {
    if (token != null) {
      final UsersDevicesToken udt = UsersDevicesToken(userId: userId, deviceId: deviceId, fcmToken: token);
      await _supabase.from(Tables.usersDevicesToken.tableName).upsert(udt);
    }
  }

  Future<void> _removeFcmToken(String deviceId, String? token) async {
    if (token != null) {
      final udt = Tables.usersDevicesToken;
      await _supabase.from(udt.tableName).delete().eq(udt.deviceId, deviceId);
    }
  }
}