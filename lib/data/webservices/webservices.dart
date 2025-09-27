import 'package:currency/data/models/currencymodel.dart';
import 'package:currency/data/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'webservices.g.dart';

@RestApi(baseUrl: Apistrings.baseUrl)
abstract class Webservices {
  factory Webservices(Dio dio, {String? baseUrl}) = _Webservices;

  @GET(Apistrings.conversion)
  Future<CurrencyModel> getLatestRates(
    @Query("base_currency") String baseCurrency,
  );
}
