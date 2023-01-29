import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/app_config.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_client.dart';


class RestaurantServices{
  Future<Response?> getRestaurants() async {
    final response = await NetworkProvider().call(path: AppConfig.restaurant, method: RequestMethod.get,);
    return response;
  }
}