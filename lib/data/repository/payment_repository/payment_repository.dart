import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/payment_services/payment_services.dart';
import 'package:flutter/cupertino.dart';

class PaymentRepository {
  final PaymentServices _paymentServices;
  PaymentRepository(this._paymentServices);
  Future<Response?> getPaymentMethod() => _paymentServices.getPaymentMethod();
  Future<Response?> getPaymentSettingsPerMethod({required String id,}) => _paymentServices.getPaymentSettingsPerMethod(id: id);

}