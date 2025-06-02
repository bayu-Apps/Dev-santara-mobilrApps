import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setOnboardingSeen() async {
    await _prefs.setBool('onboarding_seen', true);// Delay loading
  }

  static Future<bool> getOnboardingSeen() async {
    return _prefs.getBool('onboarding_seen') ?? false;
  }

  static Future<void> setLogin(bool isLoggedIn) async {
    await _prefs.setBool('is_logged_in', isLoggedIn);
  }

  static Future<bool> isLoggedIn() async {
    return _prefs.getBool('is_logged_in') ?? false;
  }

  static Future<void> logout() async {
    await _prefs.setBool('is_logged_in', false);
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
