import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/dashboard_services/restaurant_services.dart';

class RestaurantRepository {
  final RestaurantServices _restaurantServices;
  RestaurantRepository(this._restaurantServices);
  Future<Response?> getRestaurants() => _restaurantServices.getRestaurants();
}