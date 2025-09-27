import 'package:flutter/material.dart';

class CurrencyDropdown extends StatefulWidget {
  final List<String> currencies;
  final String? selectedCurrency;
  final void Function(String?) onChanged;

  const CurrencyDropdown({
    super.key,
    required this.currencies,
    required this.selectedCurrency,
    required this.onChanged,
  });

  @override
  State<CurrencyDropdown> createState() => _CurrencyDropdownState();
}

class _CurrencyDropdownState extends State<CurrencyDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("اختر العملة"),
      value: widget.selectedCurrency,
      isExpanded: true,
      items: widget.currencies.map((currency) {
        return DropdownMenuItem(
          value: currency,
          child: Text(currency),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
