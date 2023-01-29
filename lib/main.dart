import 'package:ejara_test_project/app/shared/theme_config/theme_config.dart';
import 'package:ejara_test_project/presentation/auth/login/pages/login.dart';
import 'package:ejara_test_project/presentation/payment/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'dart:io';
import 'app/di/injector.dart'as di;
import 'domain/local/local_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  await di.init();
  final LocalCachedData loggedIn = di.injector<LocalCachedData>();
  final loginStatus = await loggedIn.getLoginStatus();
  runApp(MyApp(loggedIn: loginStatus,));
}

class MyApp extends StatelessWidget {
  final bool? loggedIn;
  const MyApp({Key? key, this.loggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,));
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.applicationTheme(),
        home: loggedIn == true ? const HomeScreen() : const Login(),
      ),
    );
  }
}

