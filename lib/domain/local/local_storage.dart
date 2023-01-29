import 'dart:convert';
import 'package:ejara_test_project/app/di/injector.dart';
import 'package:ejara_test_project/data/model/user/auth_user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalCachedData{
  final SharedPreferences _prefs;
  LocalCachedData._(this._prefs);
  static Future<LocalCachedData> create() async => LocalCachedData._(await SharedPreferences.getInstance());
  static LocalCachedData get instance => injector<LocalCachedData>();

  Future<String?> getAuthToken() async {
    String? token = _prefs.getString("token");
    return token;
  }

  Future<void> cacheAuthToken({required String? token}) async {
    _prefs.setString("token", token!);
  }

  Future<void> cachePassword({required String? password}) async {
    _prefs.setString("password", password!);
  }

  Future<String?> getPassword() async {
    String? password = _prefs.getString("password");
    return password;
  }

  Future<void> cacheAuthUser({required AuthUserResponse authUserResponse}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("auth_user", json.encode(authUserResponse.toJson()));
  }

  Future<AuthUserResponse?> getAuthUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? authUser = sharedPreferences.getString("auth_user");
    return authUser == null ? null : AuthUserResponse.fromJson(jsonDecode(authUser));
  }

  Future<bool> getLoginStatus() async {
    bool? loginStatus = _prefs.getBool("isLoggedIn");
    return loginStatus ?? false;
  }

  Future<void> cacheLoginStatus({required bool isLoggedIn}) async {
    _prefs.setBool("isLoggedIn", isLoggedIn);
  }

  Future<bool> getIsEnableNotificationStatus() async {
    bool? isEnableNotification = _prefs.getBool("isEnableNotification");
    return isEnableNotification ?? false;
  }

  Future<void> cacheIsEnableNotificationStatus({required bool isEnableNotification}) async {
    _prefs.setBool("isEnableNotification", isEnableNotification);
  }

// Future<void> saveUserDetails({required UserDetails userDetails}) async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setString("saveUserDetails", jsonEncode(userDetails.toJson()));
// }
// Future<UserDetails> fetchUserDetails() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   String? userData = sharedPreferences.getString("saveUserDetails");
//   return UserDetails.fromJson(jsonDecode(userData!));
// }

}