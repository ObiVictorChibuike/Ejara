import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_client.dart';

class PaymentServices{
  Future<Response?> getPaymentMethod() async {
    final response = await NetworkProvider().call(path: "/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy", method: RequestMethod.get,);
    return response;
  }

  Future<Response?> getPaymentSettingsPerMethod() async {
    final response = await NetworkProvider().call(path: "/customer/payment-settings-per-type?paymentTypeId=1&countryCode=CM&transactionType=buy",
        method: RequestMethod.get,);
    return response;
  }
}