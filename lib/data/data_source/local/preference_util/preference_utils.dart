import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {

  static String USERID = "userId";
  static String USERNAME = "userName";
  static String USER_RESPONSE = "userResponse";
  Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = _prefsInstance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }


  static Future reset() async {
    var prefs = _prefsInstance;
    await prefs?.clear();
  }
}
