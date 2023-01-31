import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_client.dart';

class PaymentServices{
  Future<Response?> getPaymentMethod() async {
    final response = await NetworkProvider(baseUrl: "https://testbox-nellys-coin.ejaraapis.xyz/api/v2").call(path: "/marketplace/payment-types-per-country?countryCode=CM&transactionType=buy", method: RequestMethod.get,);
    return response;
  }

  Future<Response?> getPaymentSettingsPerMethod({required String id}) async {
    final response = await NetworkProvider(baseUrl: "https://testbox-nellys-coin.ejaraapis.xyz/api/v1").call(path: "/customer/payment-settings-per-type?paymentTypeId=$id&countryCode=CM&transactionType=buy",
        method: RequestMethod.get,);
    return response;
  }
}