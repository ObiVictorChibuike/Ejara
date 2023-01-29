import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/app_config.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_client.dart';

class VendorServices{
  Future<Response?> getTopRatedVendors() async {
    final response = await NetworkProvider().call(path: AppConfig.topRatedVendor, method: RequestMethod.get,);
    return response;
  }
  Future<Response?> getAllVendors() async {
    final response = await NetworkProvider().call(path: AppConfig.allVendor, method: RequestMethod.get,);
    return response;
  }
}