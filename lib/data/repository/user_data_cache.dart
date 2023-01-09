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
    if(isUserRemembered()) {
      sharedPreferences?.setString(
          kUserGlobalCacheKey, jsonEncode(user.toJson()));
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
  void writeThemePreferences(bool theme) async {
    SharedPreferences localUserData = await SharedPreferences.getInstance();
    localUserData.setBool("Theme", theme);
  }
  readThemePreferences() async {
    SharedPreferences localUserData = await SharedPreferences.getInstance();
    return localUserData.getBool("Theme");
  }
}
