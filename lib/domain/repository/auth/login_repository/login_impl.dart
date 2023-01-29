import 'package:dio/dio.dart';
import 'package:ejara_test_project/app/shared/constants/http_status.dart';
import 'package:ejara_test_project/app/shared/constants/strings.dart';
import 'package:ejara_test_project/data/model/auth/login_response.dart';
import 'package:ejara_test_project/data/repository/auth_repository/auth_repository.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/use_cases/use_cases.dart';


class LoginImpl implements useCase<DataState<LoginResponse>, LoginParam> {
  final AuthRepository _authRepository;

  LoginImpl(this._authRepository);

  @override
  Future<DataState<LoginResponse>> execute({required LoginParam params}) async{
    try {
      final response = await _authRepository.login(email: params.email!, password: params.password!);
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(LoginResponse.fromJson(response.data));
      }
      return DataFailed(response.statusMessage);
    } on DioError catch (err) {
      final errorMessage = Future.error(ApiError.fromDio(err));
      if (kDebugMode) {
        print(errorMessage);
      }
      return DataFailed(err.response?.data[Strings.error] ?? errorMessage);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
      return DataFailed(err.toString());
    }
  }

}

class LoginParam{
  final String? email;
  final String? password;
  LoginParam(this.email, this.password);
}

