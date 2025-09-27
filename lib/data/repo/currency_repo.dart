import 'package:currency/data/models/currencymodel.dart';
import 'package:currency/data/strings.dart';
import 'package:currency/data/webservices/webservices.dart';

class CurrencyRepo {
  final Webservices webServices;

  CurrencyRepo(this.webServices);
  Future<CurrencyModel> fetchRates({String baseCurrency = "USD"}) async {
    return await webServices.getLatestRates(baseCurrency);
  }
}
