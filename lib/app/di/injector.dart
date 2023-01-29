import 'package:ejara_test_project/domain/local/local_storage.dart';
import 'package:ejara_test_project/domain/repository/auth/login_repository/login_impl.dart';
import 'package:ejara_test_project/domain/repository/payment/payment_repository/payment_methods_impl.dart';
import 'package:ejara_test_project/domain/repository/payment/payment_repository/payment_settings_per_method_impl.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

/// Initializes all dependencies.
/// We register as lazy singletons to boost performance
/// meaning, Get It would instantiate objects on demand

Future<void> init() async {
  // Data - Remote
  injector.registerLazySingleton<LoginImpl>(() => LoginImpl(injector()));
  injector.registerLazySingleton<PaymentMethodImpl>(() => PaymentMethodImpl(injector()));
  injector.registerLazySingleton<PaymentSettingsPerImpl>(() => PaymentSettingsPerImpl(injector()));

  // Data - Local
  injector.registerLazySingleton<LocalCachedData>(() => LocalCachedData.instance);
}
