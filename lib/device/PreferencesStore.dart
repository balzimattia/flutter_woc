import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStore {
  static final PreferencesStore instance = PreferencesStore._();
  PreferencesStore._();

  Future<bool> getBool(String key, {bool defaultValue = true}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defaultValue;
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}