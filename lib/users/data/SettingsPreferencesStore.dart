import '../../device/PreferencesStore.dart';

class SettingPreferencesStore {
  SettingPreferencesStore._([PreferencesStore? store]) : _store = store ?? PreferencesStore.instance;

  static final SettingPreferencesStore instance = SettingPreferencesStore._();

  final PreferencesStore _store;

  static const _darkThemeKey = 'dark_theme';

  Future<bool> isDarkTheme() => _store.getBool(_darkThemeKey, defaultValue: false);

  Future<void> setDarkTheme(bool enabled) => _store.setBool(_darkThemeKey, enabled);
}