import 'package:currency/busniess_logic/cubit/currency_cubit.dart';
import 'package:currency/data/repo/currency_repo.dart';
import 'package:currency/injection.dart';
import 'package:currency/presentation/currencyScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  injection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            CurrencyCubit(getIt<CurrencyRepo>())..fetchCurrencies(),
        child: CurrencyConverterScreen(),
      ),
    );
  }
}
