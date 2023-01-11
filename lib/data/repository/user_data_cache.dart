import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/cache_keys.dart';
import '../models/user.dart';

class UserDataCache {
  static late SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void writeUserDataCachePreferences(User user) async {
    if (isUserRemembered()) {
      sharedPreferences?.setString(kUserGlobalCacheKey, jsonEncode(user.toJson()));
    }
  }

  User readUserDataCachePreferences() {
    final userData = sharedPreferences?.getString(kUserGlobalCacheKey);
    if (userData == null) {
      return User.empty;
    }
    Map<String, dynamic> userModel = jsonDecode(userData);
    User user = User.fromJson(userModel);
    return user;
  }

  void setUserRemember(bool isRemembered) {
    sharedPreferences?.setBool(kRememberMe, isRemembered);
  }

  bool isUserRemembered() {
    final isRemembered = sharedPreferences?.getBool(kRememberMe);
    if (isRemembered == null) {
      return false;
    }
    return isRemembered;
  }

  void writeLanguagePreference(String lang) async {
    sharedPreferences?.setString('language', lang);
  }

  String readLanguagePreference() {
    final lang = sharedPreferences?.getString('language');
    if (lang == null) {
      return 'en';
    }
    return lang;
  }

  void writeThemePreferences(bool theme) async {
    sharedPreferences?.setBool("Theme", theme);
  }

  readThemePreferences() async {
    return sharedPreferences?.getBool("Theme");
  }
}
