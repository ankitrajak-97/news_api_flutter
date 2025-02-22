import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final _instance = SharedPrefService._internal();
  SharedPreferences? _prefs;
  SharedPrefService._internal();
  factory SharedPrefService() => _instance;

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString({required String key, required String value}) async {
    if (_prefs == null) return false;

    return await _prefs!.setString(key, value);
  }
}
