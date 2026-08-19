import 'package:flutter/material.dart';
import '../../device/PreferencesStore.dart';

class SettingsPreferencesStore {
  SettingsPreferencesStore._([PreferencesStore? store]) : _store = store ?? PreferencesStore.instance;

  static final SettingsPreferencesStore instance = SettingsPreferencesStore._();

  final PreferencesStore _store;

  static const _darkThemeKey = 'dark_theme';

  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

  Future<void> load() async {
    final isDark = await _store.getBool(_darkThemeKey, defaultValue: false);
    themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setDarkTheme(bool enabled) async {
    themeMode.value = enabled ? ThemeMode.dark : ThemeMode.light;
    await _store.setBool(_darkThemeKey, enabled);
  }
}