import 'package:dio/dio.dart';
import 'package:ejara_test_project/app/shared/constants/http_status.dart';
import 'package:ejara_test_project/app/shared/constants/strings.dart';
import 'package:ejara_test_project/core/use_cases/use_cases.dart';
import 'package:ejara_test_project/data/model/vendor/all_vendor_response.dart';
import 'package:ejara_test_project/data/repository/dashboard_repository/vendor_respoitory.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/remote/network_servcises/dio_service_config/dio_error.dart';
import 'package:flutter/foundation.dart';


class AllVendorRepositoryImpl implements noParamUseCases<DataState<AllVendorResponse>> {
  final VendorRepository _vendorRepository;

  AllVendorRepositoryImpl(this._vendorRepository);

  @override
  Future<DataState<AllVendorResponse>> noParamCall() async{
    try {
      final response = await _vendorRepository.getAllVendors();
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {;
      return DataSuccess(AllVendorResponse.fromJson(response.data));
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