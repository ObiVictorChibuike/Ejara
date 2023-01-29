import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/app_config.dart';
import '../../../domain/remote/network_servcises/dio_service_config/dio_client.dart';


class UserServices{
  Future<Response?> getUser() async {
    final response = await NetworkProvider().call(path: AppConfig.user, method: RequestMethod.get,);
    return response;
  }
  Future<Response?> updateUser({required String email, required String firstName, required String lastName,}) async {
    var postBody = jsonEncode({
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
    });
    final response = await NetworkProvider().call(path: AppConfig.updateUser, method: RequestMethod.put, body: postBody);
    return response;
  }
}