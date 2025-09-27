import 'package:currency/data/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:currency/data/repo/currency_repo.dart';
import 'package:currency/data/webservices/webservices.dart';

final getIt = GetIt.instance;

void injection() {
  Dio dio = DioFactory.create();
  // Register Dio

  // Register Webservices (Retrofit needs Dio + optional baseUrl)
  getIt.registerLazySingleton<Webservices>(
    () => Webservices(dio), // هنا بمرر Dio
  );

  // Register Repo
  getIt.registerLazySingleton<CurrencyRepo>(
    () => CurrencyRepo(getIt<Webservices>()),
  );
}
