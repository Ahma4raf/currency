import 'package:currency/busniess_logic/cubit/currency_cubit.dart';
import 'package:currency/presentation/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currency Convertion")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CurrencyCubit, CurrencyState>(
          builder: (context, state) {
            if (state is CurrencyLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CurrencyLoaded) {
              final currencies = state.currencies.data.keys.toList();
              final cubit = context.read<CurrencyCubit>();

              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: "Enter Any Amount",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      const Text("From: "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        child: CurrencyDropdown(
                          currencies: currencies,
                          selectedCurrency: cubit.fromCurrency,
                          onChanged: cubit.changeFromCurrency,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text("To: "),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        child: CurrencyDropdown(
                          currencies: currencies,
                          selectedCurrency: cubit.toCurrency,
                          onChanged: cubit.changeToCurrency,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final amount = double.tryParse(_controller.text);
                      if (amount != null) {
                        setState(() {
                          _result = cubit.convert(amount);
                        });
                      }
                    },
                    child: const Text("Convert"),
                  ),
                  const SizedBox(height: 20),
                  if (_result != null)
                    Text(
                      " ${_result!.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              );
            } else if (state is Currencyfailed) {
              return Center(child: Text("Error: ${state.error}"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
