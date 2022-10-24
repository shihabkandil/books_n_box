import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/cache_keys.dart';
import '../models/user.dart';

class UserDataCache{
  static late SharedPreferences _localUserData;

  static Future init() async{
    _localUserData = await SharedPreferences.getInstance();
}

  void writeUserDataCachePreferences(User user) async {
    _localUserData.setString(userGlobalCacheKey, jsonEncode(user.toJson()));
  }

  User readUserDataCachePreferences() {
      Map<String,dynamic> userModel = jsonDecode(_localUserData.getString(userGlobalCacheKey)??'');
      User user = User.fromJson(userModel);
    print(user);
    return user;
  }
}