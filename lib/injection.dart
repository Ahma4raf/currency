import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:currency/data/repo/currency_repo.dart';
import 'package:currency/data/webservices/webservices.dart';

final getIt = GetIt.instance;

void injection() {
  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Register Webservices (Retrofit needs Dio + optional baseUrl)
  getIt.registerLazySingleton<Webservices>(
    () => Webservices(getIt<Dio>()), // هنا بمرر Dio
  );

  // Register Repo
  getIt.registerLazySingleton<CurrencyRepo>(
    () => CurrencyRepo(getIt<Webservices>()),
  );
}
