import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserData(String jsonData) async {
    await _prefs.setString('userData', jsonData);
  }

  static setBool({required String key, required bool value}) {
    _prefs.setBool(key, value);
  }

  static getBool({required String key}) {
    return _prefs.getBool(key) ?? false;
  }

  static setString({required String key, required String value}) async {
    await _prefs.setString(key, value);
  }
}
