import 'package:flutter/material.dart';
import 'package:flutter_woc/auth/data/AuthRepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../notifications/NotificationPreferencesStore.dart';
import '../../notifications/NotificationType.dart';
import '../data/SettingsPreferencesStore.dart';
import '../states/ChangePasswordState.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({
    NotificationPreferencesStore? notificationPreferencesStore,
    AuthRepository? authRepository,
  })  : _notificationPreferencesStore = notificationPreferencesStore ?? NotificationPreferencesStore.instance,
        _authRepository = authRepository ?? AuthRepository.instance {
    _loadInitialState();
    SettingsPreferencesStore.instance.themeMode.addListener(_onThemeChanged);
  }

  final NotificationPreferencesStore _notificationPreferencesStore;
  final AuthRepositoryInterface _authRepository;

  Map<NotificationType, bool> notificationPreferences = {};
  ChangePasswordState changePasswordState = const ChangePasswordState();

  bool get isDarkTheme => SettingsPreferencesStore.instance.themeMode.value == ThemeMode.dark;

  void _onThemeChanged() => notifyListeners();

  Future<void> _loadInitialState() async {
    notificationPreferences = await _notificationPreferencesStore.getAll();
    notifyListeners();
  }

  Future<void> setNotificationEnabled(NotificationType type, bool enabled) async {
    await _notificationPreferencesStore.setEnabled(type, enabled);
    notificationPreferences = {...notificationPreferences, type: enabled};
    notifyListeners();
  }

  Future<void> setDarkTheme(bool enabled) async {
    await SettingsPreferencesStore.instance.setDarkTheme(enabled);
  }

  void onNewPasswordChange(String value) {
    changePasswordState = changePasswordState.copyWith(
      newPassword: value,
      newPasswordError: null,
    );
    notifyListeners();
  }

  void onConfirmPasswordChange(String value) {
    changePasswordState = changePasswordState.copyWith(
      confirmPassword: value,
      confirmPasswordError: null,
    );
    notifyListeners();
  }

  Future<void> onChangePasswordClick() async {
    if (!_validatePasswordForm()) return;

    changePasswordState = changePasswordState.copyWith(isLoading: true);
    notifyListeners();

    try {
      await _authRepository.updatePassword(changePasswordState.newPassword);
      changePasswordState = changePasswordState.copyWith(
        isLoading: false,
        saveSuccess: true,
      );
    } on AuthException catch (e) {
      if (e.code == _AuthErrorCodes.samePassword) {
        changePasswordState = changePasswordState.copyWith(
          isLoading: false,
          newPasswordError: 'Nuova password uguale a quella corrente',
        );
      }
    } catch (e) {
      changePasswordState = changePasswordState.copyWith(
        isLoading: false,
        newPasswordError: 'Qualcosa è andato storto',
      );
    }
    notifyListeners();
  }

  bool _validatePasswordForm() {
    final newPasswordError =
    changePasswordState.newPassword.length < 8 ? 'Minimo 8 caratteri' : null;
    final confirmPasswordError =
    changePasswordState.newPassword != changePasswordState.confirmPassword
        ? 'Le password non coincidono'
        : null;

    changePasswordState = changePasswordState.copyWith(
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
    );
    notifyListeners();

    return newPasswordError == null && confirmPasswordError == null;
  }

  @override
  void dispose() {
    SettingsPreferencesStore.instance.themeMode.removeListener(_onThemeChanged);
    super.dispose();
  }
}


class _AuthErrorCodes {
  _AuthErrorCodes._();
  static const String samePassword = 'same_password';
}