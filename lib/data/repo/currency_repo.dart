import 'package:currency/data/models/currencymodel.dart';
import 'package:currency/data/strings.dart';
import 'package:currency/data/webservices/webservices.dart';

class CurrencyRepo {
  final Webservices webServices;

  CurrencyRepo(this.webServices);
  Future<CurrencyModel> fetchRates({
     String apiKey=Apistrings.apiKey,
    String baseCurrency = "USD",
    String currencies = "EUR",
  }) async {
    return await webServices.getLatestRates( baseCurrency, currencies);
  }
}
