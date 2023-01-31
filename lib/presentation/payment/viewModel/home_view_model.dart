import 'package:ejara_test_project/core/state/view_state.dart';
import 'package:ejara_test_project/data/model/payment/payment_methods_response.dart';
import 'package:ejara_test_project/data/model/payment/payment_settings_per_method_response.dart';
import 'package:ejara_test_project/data/repository/payment_repository/payment_repository.dart';
import 'package:ejara_test_project/data/services/payment_services/payment_services.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/repository/payment/payment_repository/payment_methods_impl.dart';
import 'package:ejara_test_project/domain/repository/payment/payment_repository/payment_settings_per_method_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends ChangeNotifier{
  HomeViewModel(){
    getPaymentMethod();
  }
  String? errorMessage;

  ///Initialize dependencies
  final _getPaymentMethod = Get.put(PaymentMethodImpl(PaymentRepository(PaymentServices())));
  final _getPaymentSettingsPerMethod = Get.put(PaymentSettingsPerImpl(PaymentRepository(PaymentServices())));

  ///View state for payment method response
  ViewState<PaymentMethodResponse> viewState = ViewState(state: ResponseState.EMPTY);
  void _setViewState(ViewState<PaymentMethodResponse> viewState) {
    this.viewState = viewState;
  }

  ///View state for payment settings method response
  ViewState<PaymentSettingsPerMethodResponse> paymentSettingsPerMethodViewState = ViewState(state: ResponseState.EMPTY);
  void _setPaymentSettingsPerMethodViewState(ViewState<PaymentSettingsPerMethodResponse> paymentSettingsPerMethodViewState) {
    this.paymentSettingsPerMethodViewState = paymentSettingsPerMethodViewState;
  }

  ///Fetch payment method
  Future<void> getPaymentMethod() async {
    _setViewState(ViewState.loading());
    await _getPaymentMethod.noParamCall().then((value) async {
      if(value is DataSuccess || value.data != null) {
        _setViewState(ViewState.complete(value.data!));
        notifyListeners();
      }if (value is DataFailed || value.data == null) {
        if (kDebugMode) {
          print(value.error);
        }errorMessage = value.error.toString();
        notifyListeners();
        _setViewState(ViewState.error(value.error.toString()));
      }}
    );
  }

  ///Fetch Payment Per Method by their id
  Future<void> getPaymentSettingsPerMethod({required String id}) async {
    _setPaymentSettingsPerMethodViewState(ViewState.loading());
    await _getPaymentSettingsPerMethod.execute(params: PaymentSettingsParam(id)).then((value) async {
      if(value is DataSuccess || value.data != null) {
        _setPaymentSettingsPerMethodViewState(ViewState.complete(value.data!));
        notifyListeners();
      }if (value is DataFailed || value.data == null) {
        if (kDebugMode) {
          print(value.error);
        }errorMessage = value.error.toString();
        notifyListeners();
        _setPaymentSettingsPerMethodViewState(ViewState.error(value.error.toString()));
      }}
    );
  }
}