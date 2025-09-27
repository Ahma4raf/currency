import 'package:bloc/bloc.dart';
import 'package:currency/data/models/currencymodel.dart';
import 'package:currency/data/repo/currency_repo.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepo repo;
  CurrencyCubit(this.repo) : super(CurrencyLoading());

  void fetchCurrencies({
    String baseCurrency = 'USD',
    String curr = "EUR",
  }) async {
    try {
      final currencies = await repo.fetchRates(
        baseCurrency: baseCurrency,
        currencies: curr,
      );
      emit(CurrencyLoaded(currencies));
    } catch (e) {
      emit(Currencyfailed(e.toString()));
    }
  }
}
