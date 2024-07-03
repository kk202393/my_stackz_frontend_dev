import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static AppPreferences shared = AppPreferences();

  saveSharedPreferences(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  removePreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }

  saveBoolSharedPreferences(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  saveIsFirstInstallPreferences(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  getSharedPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }

  getBoolSharedPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? false;
  }

  getIsFirstInstallPreferences(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? true;
  }

  clearAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
