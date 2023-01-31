import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_client.dart';

class AuthServices{

  Future<Response?> login({required String userName, required String password}) async {
    var postBody = jsonEncode({
        "log":  userName,
        "password": password,
    });
    final response = await NetworkProvider(baseUrl: "https://testbox-nellys-coin.ejaraapis.xyz/api/v1").call(path: "/auth/login", method: RequestMethod.post, body: postBody);
    return response;
  }

}