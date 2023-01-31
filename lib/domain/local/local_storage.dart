import 'dart:convert';
import 'package:ejara_test_project/data/model/auth/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalCachedData{

  Future<String?> getAuthToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    return token;
  }

  Future<void> cacheAuthToken({required String? token}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token!);
  }

  Future<void> cachePassword({required String? password}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("password", password!);
  }

  Future<String?> getPassword() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? password = sharedPreferences.getString("password");
    return password;
  }

  Future<void> cacheAuthUser({required LoginResponse loginResponse}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("login_response", json.encode(loginResponse.toJson()));
  }

  Future<LoginResponse?> getAuthUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? loginResponse = sharedPreferences.getString("login_response");
    return loginResponse == null ? null : LoginResponse.fromJson(jsonDecode(loginResponse));
  }

  Future<bool> getLoginStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool? loginStatus = sharedPreferences.getBool("isLoggedIn");
    return loginStatus ?? false;
  }

  Future<void> cacheLoginStatus({required bool isLoggedIn}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedIn", isLoggedIn);
  }

  Future<bool> getIsEnableNotificationStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool? isEnableNotification = sharedPreferences.getBool("isEnableNotification");
    return isEnableNotification ?? false;
  }

  Future<void> cacheIsEnableNotificationStatus({required bool isEnableNotification}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isEnableNotification", isEnableNotification);
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