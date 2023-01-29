import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/auth_services/auth_servcices.dart';

class AuthRepository {
  final AuthServices _authServices;
  AuthRepository(this._authServices);

  Future<Response?> login({required String email, required String password}) => _authServices.login(email: email, password: password,);

  Future<Response?> register({required String firstName, required String lastName, required String email,
    required String phoneNumber, required String password}) => _authServices.register(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, password: password);

}