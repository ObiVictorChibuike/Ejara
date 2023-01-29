import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_client.dart';

class AuthServices{

  Future<Response?> login({required String userName, required String password}) async {
    var postBody = jsonEncode({
        "userName":  userName,
        "password": password,
    });
    final response = await NetworkProvider().call(path: "/auth/login", method: RequestMethod.post, body: postBody);
    return response;
  }

}