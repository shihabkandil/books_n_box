import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/cache_keys.dart';
import '../models/user.dart';

class UserDataCache{

  void writeUserDataCachePreferences(User user) async {
    SharedPreferences localUserData = await SharedPreferences.getInstance();
    localUserData.setString(userGlobalCacheKey, jsonEncode(user.toJson()));
  }

  Future<User> readUserDataCachePreferences() async {
    SharedPreferences localUserData = await SharedPreferences.getInstance();
      Map<String,dynamic> userModel = jsonDecode(localUserData.getString(userGlobalCacheKey)??'');
      User user = User.fromJson(userModel);
    return user;
  }
}