import 'package:currency/data/strings.dart';
import 'package:dio/dio.dart';


class DioFactory {
  static Dio create() {
    final dio = Dio(BaseOptions(
      baseUrl: Apistrings.baseUrl,
    ));

    // نضيف Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
       
          options.queryParameters["apikey"] = Apistrings.apiKey;
          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
