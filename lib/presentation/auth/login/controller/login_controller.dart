import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier{
  // final _login = Get.put(LoginImpl(AuthRepository(AuthServices())));
  // final _getAuthUser = Get.put(UserRepositoryImpl(UserRepository(UserServices())));
  //
  // //Form Controllers
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  //
  // //Variables
  // bool? networkState;
  // String? errorMessage;
  // bool togglePassword = true;
  // String? userPassword;
  //
  // //Initialize State
  // ViewState<AuthUserResponse> viewState = ViewState(state: ResponseState.EMPTY);
  //
  // void _setViewState(ViewState<AuthUserResponse> viewState) {
  //   this.viewState = viewState;
  // }
  //
  // void togglePasswordVisibility(){
  //   togglePassword = !togglePassword;
  //   update();
  // }
  //
  //
  // Future<void> login()async{
  //   await _login.execute(params: LoginParam(emailController.text.trim(), passwordController.text.trim())).then((value) async {
  //     if(value is DataSuccess || value.data != null) {
  //       final token = value.data!.token!;
  //       await LocalCachedData.instance.cacheAuthToken(token: token);
  //       await _getAuthUser.noParamCall().then((value) async {
  //         if(value is DataSuccess || value.data != null){
  //           await LocalCachedData.instance.cacheAuthUser(authUserResponse: value.data!);
  //           await LocalCachedData.instance.cacheLoginStatus(isLoggedIn: true).whenComplete(() async {
  //             _setViewState(ViewState.complete(value.data!));
  //             update();
  //           });
  //         }
  //         if (value is DataFailed || value.data == null) {
  //           if (kDebugMode) {
  //             print(value.error.toString());
  //           }
  //           errorMessage = value.error.toString();
  //           _setViewState(ViewState.error(value.error.toString()));
  //           update();
  //         }
  //       });
  //     }
  //     if (value is DataFailed || value.data == null) {
  //       if (kDebugMode) {
  //         log(value.error!);
  //         print(value.error!);
  //       }
  //       errorMessage = value.error;
  //       _setViewState(ViewState.error(value.error!));
  //       log(errorMessage!);
  //       update();
  //     }}
  //   );
  // }
  //
  //
  // Future<void> onInitializeLocalStorage() async {
  //   Get.put<LocalCachedData>(await LocalCachedData.create());
  //   super.onInit();
  // }
  //
  // @override
  // void onInit() {
  //   onInitializeLocalStorage();
  //   super.onInit();
  // }
}