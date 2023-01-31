import 'package:dio/dio.dart';
import 'package:ejara_test_project/app/shared/constants/http_status.dart';
import 'package:ejara_test_project/app/shared/constants/strings.dart';
import 'package:ejara_test_project/core/use_cases/use_cases.dart';
import 'package:ejara_test_project/data/model/payment/payment_settings_per_method_response.dart';
import 'package:ejara_test_project/data/repository/payment_repository/payment_repository.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_error.dart';
import 'package:flutter/foundation.dart';


class PaymentSettingsPerImpl implements useCase<DataState<PaymentSettingsPerMethodResponse>, PaymentSettingsParam> {
  final PaymentRepository _paymentRepository;

  PaymentSettingsPerImpl(this._paymentRepository);

  @override
  Future<DataState<PaymentSettingsPerMethodResponse>> execute({required PaymentSettingsParam params}) async{
    try {
      final response = await _paymentRepository.getPaymentSettingsPerMethod(id: params.id!);
      if (response!.statusCode == HttpResponseStatus.ok || response.statusCode == HttpResponseStatus.success) {;
      return DataSuccess(PaymentSettingsPerMethodResponse.fromJson(response.data));
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

class PaymentSettingsParam{
  final String? id;
  PaymentSettingsParam(this.id,);
}