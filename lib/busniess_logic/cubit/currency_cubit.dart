import 'package:bloc/bloc.dart';
import 'package:currency/data/models/currencymodel.dart';
import 'package:currency/data/repo/currency_repo.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepo repo;

  String? fromCurrency; // العملة اللي هتتحول منها
  String? toCurrency;   // العملة اللي هتتحول ليها

  CurrencyCubit(this.repo) : super(CurrencyLoading());

  Future<void> fetchCurrencies({String baseCurrency = "USD"}) async {
    try {
      final model = await repo.fetchRates(baseCurrency: baseCurrency);
      fromCurrency = model.data.keys.first;
      toCurrency = model.data.keys.first;
      emit(CurrencyLoaded(model));
    } catch (e) {
      emit(Currencyfailed(e.toString()));
    }
  }

  void changeFromCurrency(String? currency) {
    fromCurrency = currency;
    emit(CurrencyLoaded((state as CurrencyLoaded).currencies));
  }

  void changeToCurrency(String ?currency) {
    toCurrency = currency;
    emit(CurrencyLoaded((state as CurrencyLoaded).currencies));
  }

  double? convert(double amount) {
    if (state is CurrencyLoaded && fromCurrency != null && toCurrency != null) {
      final rates = (state as CurrencyLoaded).currencies.data;
      final fromRate = rates[fromCurrency!]!;
      final toRate = rates[toCurrency!]!;
      return amount / fromRate * toRate;
    }
    return null;
  }
}
