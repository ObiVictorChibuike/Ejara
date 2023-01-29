import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/user_services/user_services.dart';

class UserRepository {
  final UserServices _userServices;
  UserRepository(this._userServices);
  Future<Response?> getUser() => _userServices.getUser();
  Future<Response?> updateUser({required String email, required String firstName, required String lastName})
  => _userServices.updateUser(email: email, firstName: firstName, lastName: lastName,);

}