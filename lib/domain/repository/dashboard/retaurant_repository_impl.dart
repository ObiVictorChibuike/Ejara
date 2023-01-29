import 'package:dio/dio.dart';
import 'package:ejara_test_project/app/shared/constants/http_status.dart';
import 'package:ejara_test_project/app/shared/constants/strings.dart';
import 'package:ejara_test_project/core/use_cases/use_cases.dart';
import 'package:ejara_test_project/data/model/restaurant_response/restaurant_response.dart';
import 'package:ejara_test_project/data/repository/dashboard_repository/restaurant_repository.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:flutter/foundation.dart';


class RestaurantRepositoryImpl implements noParamUseCases<DataState<GetAllRestaurantResponse>> {
  final RestaurantRepository _restaurantRepository;

  RestaurantRepositoryImpl(this._restaurantRepository);

  @override
  Future<DataState<GetAllRestaurantResponse>> noParamCall() async{
    try {
      final response = await _restaurantRepository.getRestaurants();
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {;
      return DataSuccess(GetAllRestaurantResponse.fromJson(response.data));
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