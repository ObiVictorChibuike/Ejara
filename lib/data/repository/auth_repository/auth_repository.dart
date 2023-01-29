import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/auth_services/auth_servcices.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(this._authServices);
  Future<Response?> login({required String userName, required String password}) => _authServices.login(userName: userName, password: password,);
}