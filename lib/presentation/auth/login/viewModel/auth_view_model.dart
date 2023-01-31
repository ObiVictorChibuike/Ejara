import 'dart:developer';

import 'package:ejara_test_project/core/state/view_state.dart';
import 'package:ejara_test_project/data/model/auth/login_response.dart';
import 'package:ejara_test_project/data/repository/auth_repository/auth_repository.dart';
import 'package:ejara_test_project/data/services/auth_services/auth_servcices.dart';
import 'package:ejara_test_project/domain/local/local_storage.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/repository/auth/login_repository/login_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel with ChangeNotifier{
  ///Initialize dependencies
  final _loginImpl = Get.put(LoginImpl(AuthRepository(AuthServices())));
  // final LoginImpl _loginImpl = injector<LoginImpl>();

  ///Initialize local Storage
  LocalCachedData localCachedData = LocalCachedData();

  //Variables
  bool? networkState;
  String? errorMessage;
  bool togglePassword = true;
  String? userPassword;

  //Initialize State
  ViewState<LoginResponse> viewState = ViewState(state: ResponseState.EMPTY);

  void _setViewState(ViewState<LoginResponse> viewState) {
    this.viewState = viewState;
  }


  Future<void> login({required String userName, required String password})async{
    await _loginImpl.execute(params: LoginParam(userName, password)).then((value) async {
      if(value is DataSuccess || value.data != null) {
        final token = value.data!.token!;
        await localCachedData.cacheAuthToken(token: token);
        _setViewState(ViewState.complete(value.data!));
        notifyListeners();
      }
      if (value is DataFailed || value.data == null) {
        if (kDebugMode) {
          log(value.error!);
          print(value.error!);
        }
        errorMessage = value.error;
        _setViewState(ViewState.error(value.error!));
        log(errorMessage!);
        notifyListeners();
      }}
    );
  }

}