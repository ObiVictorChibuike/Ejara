import 'package:dio/dio.dart';
import 'package:ejara_test_project/app/shared/constants/http_status.dart';
import 'package:ejara_test_project/app/shared/constants/strings.dart';
import 'package:ejara_test_project/core/use_cases/use_cases.dart';
import 'package:ejara_test_project/data/model/user/update_user-response.dart';
import 'package:ejara_test_project/data/repository/user_repository/user_repository.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:flutter/foundation.dart';


class UpdateUserImpl implements useCase<DataState<UpdateUserResponse>, UpdateUserProfileParam> {
  final UserRepository _userRepository;

  UpdateUserImpl(this._userRepository);

  @override
  Future<DataState<UpdateUserResponse>> execute({required UpdateUserProfileParam params}) async{
    try {
      final response = await _userRepository.updateUser(email: params.email!, firstName: params.firstName!, lastName: params.lastName!);
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {
        return DataSuccess(UpdateUserResponse.fromJson(response.data));
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

class UpdateUserProfileParam{
  final String? firstName;
  final String? lastName;
  final String? email;
  UpdateUserProfileParam(this.firstName, this.lastName, this.email,);
}