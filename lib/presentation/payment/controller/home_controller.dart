import 'package:ejara_test_project/app/di/injector.dart';
import 'package:ejara_test_project/core/state/view_state.dart';
import 'package:ejara_test_project/data/model/payment/payment_methods_response.dart';
import 'package:ejara_test_project/domain/remote/dio_config/dio_data_state.dart';
import 'package:ejara_test_project/domain/repository/payment/payment_repository/payment_methods_impl.dart';
import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier{
  String? errorMessage;
  final PaymentMethodImpl _login = injector<PaymentMethodImpl>();

  ///View state for payment method response
  ViewState<PaymentMethodResponse> viewState = ViewState(state: ResponseState.EMPTY);
  void _setViewState(ViewState<PaymentMethodResponse> viewState) {
    this.viewState = viewState;
  }

  // ViewState<TopRatedVendorResponse> topRatedVendorViewState = ViewState(state: ResponseState.EMPTY);
  //
  // void _setTopRatedVendorViewState(ViewState<TopRatedVendorResponse> topRatedVendorViewState) {
  //   this.topRatedVendorViewState = topRatedVendorViewState;
  // }
  //
  // ViewState<UpdateUserResponse> updateUserProfileViewState = ViewState(state: ResponseState.EMPTY);
  //
  // void _setUpdateUserProfileViewState(ViewState<UpdateUserResponse> updateUserProfileViewState) {
  //   this.updateUserProfileViewState = updateUserProfileViewState;
  // }
  //
  // ViewState<GetAllRestaurantResponse> userDataViewState = ViewState(state: ResponseState.EMPTY);
  //
  // void _setUserDataViewState(ViewState<GetAllRestaurantResponse> userDataViewState) {
  //   this.userDataViewState = userDataViewState;
  // }
  //
  // ViewState<AllVendorResponse> allVendorViewState = ViewState(state: ResponseState.EMPTY);
  //
  // void _setAllVendorViewState(ViewState<AllVendorResponse> allVendorViewState) {
  //   this.allVendorViewState = allVendorViewState;
  // }

  Future<void> getPaymentMethod() async {
    _setViewState(ViewState.loading());
    await _login.noParamCall().then((value) async {
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
  // // UpdateUserResponse? updateUserResponse;
  //
  // Future<void> updateUserProfile(String firstName, lastName, email)async{
  //   await updateUser.execute(params: UpdateUserProfileParam(firstName, lastName, email)).then((value) async {
  //     if(value is DataSuccess || value.data != null) {
  //       await getUser();
  //       _setUpdateUserProfileViewState(ViewState.complete(value.data!));
  //       // updateUserResponse = value.data;
  //       update();
  //     }
  //     if (value is DataFailed || value.data == null) {
  //       if (kDebugMode) {
  //         print(value.error.toString());
  //       }
  //       errorMessage = value.error.toString();
  //       _setUpdateUserProfileViewState(ViewState.error(value.error.toString()));
  //       update();
  //     }}
  //   );
  // }
  //
  // Future<void> getUser()async{
  //   await user.noParamCall().then((value) async {
  //     if(value is DataSuccess || value.data != null) {
  //       authUserResponse = value.data;
  //       await LocalCachedData.instance.cacheAuthUser(authUserResponse: value.data!);
  //       update();
  //     }
  //     if (value is DataFailed || value.data == null) {
  //       if (kDebugMode) {
  //         print(value.error.toString());
  //       }
  //       errorMessage = value.error.toString();
  //       _setUserDataViewState(ViewState.error(value.error.toString()));
  //       update();
  //     }}
  //   );
  // }
  //
  // Future<void> getTopRatedVendors() async {
  //   _setTopRatedVendorViewState(ViewState.loading());
  //   await _getTopRatedVendor.noParamCall().then((value) async {
  //     if(value is DataSuccess || value.data != null) {
  //       topRatedVendorResponse = value.data!;
  //       _setTopRatedVendorViewState(ViewState.complete(value.data!));
  //       update();
  //     }if (value is DataFailed || value.data == null) {
  //       if (kDebugMode) {
  //         print(value.error);
  //       }errorMessage = value.error.toString();
  //       update();
  //       _setTopRatedVendorViewState(ViewState.error(value.error.toString()));
  //     }}
  //   );
  // }
  // AuthUserResponse? authUserResponse;
  //
  // Future<void> onInitializeLocalStorage() async {
  //   Get.put<LocalCachedData>(await LocalCachedData.create());
  //   await LocalCachedData.instance.getAuthUser().then((value){
  //     authUserResponse = value;
  //     update();
  //   super.onInit();
  //   });
  // }
  //
  // Future<void> getAllVendors() async {
  //   _setAllVendorViewState(ViewState.loading());
  //   await _allVendor.noParamCall().then((value) async {
  //     if(value is DataSuccess || value.data != null) {
  //       _setAllVendorViewState(ViewState.complete(value.data!));
  //       update();
  //     }if (value is DataFailed || value.data == null) {
  //       if (kDebugMode) {
  //         print(value.error);
  //       }errorMessage = value.error.toString();
  //       update();
  //       _setAllVendorViewState(ViewState.error(value.error.toString()));
  //     }}
  //   );
  // }
  //
  //
  // @override
  // void onInit() {
  //   getNotificationStatus();
  //   onInitializeLocalStorage();
  //   getRestaurants();
  //   getAllVendors();
  //   getTopRatedVendors();
  //   super.onInit();
  // }
}