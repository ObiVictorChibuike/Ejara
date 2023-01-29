import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/payment_services/payment_services.dart';

class PaymentRepository {
  final PaymentServices _paymentServices;
  PaymentRepository(this._paymentServices);
  Future<Response?> getPaymentMethod() => _paymentServices.getPaymentMethod();
  Future<Response?> getPaymentSettingsPerMethod() => _paymentServices.getPaymentSettingsPerMethod();

}