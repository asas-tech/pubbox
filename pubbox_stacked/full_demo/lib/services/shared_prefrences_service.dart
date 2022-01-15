import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

//we are initalizing shared prefs in here
@singleton
class SharedPreferenceService {
  static SharedPreferenceService? _instance;

  @factoryMethod
  static Future<SharedPreferenceService> getInstance() async {
    _instance =
        SharedPreferenceService._(await SharedPreferences.getInstance());
    return _instance!;
  }

  final SharedPreferences _preferences;
  SharedPreferenceService._(this._preferences);

  static const _themeIndexKey = 'user_key';
  static const _loggedInKey = 'logggedIn';
  static const _localeKey = 'locale';
  static const _notificationKey = 'notification';
  static const _fcmToken = 'fcm_token';
  static const _firstTimeKey = 'firstTime';
  static const _userThemeModeKey = 'user_theme_mode_key';
  static const _rtlKey = 'rtl_key';
  static const _appBarKey = 'appbar_key';

  int? get themeIndex => _getFromDisk(_themeIndexKey);

  set themeIndex(int? value) => _saveToDisk(_themeIndexKey, value);

  bool get isLoggedIn => _getFromDisk(_loggedInKey) ?? false;

  set isLoggedIn(bool value) => _saveToDisk(_loggedInKey, value);

  bool get isRtl => _getFromDisk(_rtlKey) ?? false;

  set isRtl(bool value) => _saveToDisk(_rtlKey, value);

  bool get isFloating => _getFromDisk(_appBarKey) ?? true;

  set isFloating(bool value) => _saveToDisk(_appBarKey, value);

  String get locale => _getFromDisk(_localeKey) ?? 'ar';

  set locale(String value) => _saveToDisk(_localeKey, value);

  bool get isNotification => _getFromDisk(_notificationKey) ?? true;

  set isNotification(bool value) => _saveToDisk(_notificationKey, value);

  String get fcmToken => _getFromDisk(_fcmToken) ?? '';

  set fcmToken(String? value) => _saveToDisk(_fcmToken, value);

  bool get isFirstTime => _getFromDisk(_firstTimeKey) ?? true;

  set isFirstTime(bool value) => _saveToDisk(_firstTimeKey, value);

  ThemeMode? get userThemeMode {
    var userThemeString = _getFromDisk(_userThemeModeKey);
    if (userThemeString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }

    if (userThemeString == ThemeMode.light.toString()) {
      return ThemeMode.light;
    }

    return null;
  }

  set userThemeMode(ThemeMode? value) {
    if (value == null) {
      _saveToDisk(_userThemeModeKey, value);
    } else {
      var userTheme = value.toString();
      _saveToDisk(_userThemeModeKey, userTheme);
    }
  }

  void clearPreferences() {
    _preferences.clear();
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void _saveToDisk(String key, dynamic content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
