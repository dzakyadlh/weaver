import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    // Retrieve data from shared preferences
    var value = _preferences.get(key);

    // Easily log the data that we retrieve from shared preferences
    debugPrint('Retrieved $key: $value');

    // Return the data that we retrieve from shared preferences
    return value;
  }

  void _saveData(String key, dynamic value) {
    // Easily log the data that we save to shared preferences
    debugPrint('Saving $key: $value');

    // Save data to shared preferences
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }
}
