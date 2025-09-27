import 'package:json_annotation/json_annotation.dart';

part 'currencymodel.g.dart';

@JsonSerializable()
class CurrencyModel {
  final Map<String, double> data;
  CurrencyModel({required this.data});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
