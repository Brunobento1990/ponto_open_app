import 'package:shared_preferences/shared_preferences.dart';

class StorageAdapter {
  static Future<String?> getStringStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<bool> setStringStorage(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
