part of 'currency_cubit.dart';

@immutable
sealed class CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyLoaded extends CurrencyState {
  final CurrencyModel currencies;
  CurrencyLoaded(this.currencies);
}

final class Currencyfailed extends CurrencyState {
  final String error;
  Currencyfailed(this.error);
}
