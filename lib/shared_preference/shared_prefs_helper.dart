import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final _instance = SharedPref._internal();
  SharedPreferences? _prefs;
  SharedPref._internal();
  factory SharedPref() => _instance;

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Future<bool> setStringOld({required String key, required String value}) async {
  //   if (_prefs == null) return false;
  //   return await _prefs!.setString(key, value);
  // }

  // GET SET STRING
  Future<bool> setString({required String key, required String value}) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  String? getString({required String key}) {
    return _prefs?.getString(key);
  }

  // GET SET INT
  Future<bool> setInt({required String key, required int value}) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  int? getInt({required String key}) {
    return _prefs?.getInt(key);
  }

  // GET SET BOOLEAN
  Future<bool> setBool({required String key, required bool value}) async {
    return await _prefs?.setBool(key, value) ?? false;
  }

  bool? getBool({required String key}) {
    return _prefs?.getBool(key);
  }

  // create methods that will save data into shared pref

  // create method that can retrive data from shared pref
}
