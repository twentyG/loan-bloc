// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanModel _$LoanModelFromJson(Map<String, dynamic> json) => LoanModel(
      product_name: json['product_name'] as String?,
      take_date: _$JsonConverterFromJson<String, DateTime>(
          json['take_date'], const CustomDateTimeConverter().fromJson),
      currency: json['currency'] as String?,
      holidays: (json['holidays'] as List<dynamic>?)
              ?.map(
                  (e) => const CustomDateTimeConverter().fromJson(e as String))
              .toList() ??
          const [],
      workDays: (json['workDays'] as List<dynamic>?)
              ?.map(
                  (e) => const CustomDateTimeConverter().fromJson(e as String))
              .toList() ??
          const [],
      amount: (json['amount'] as num?)?.toDouble(),
      percent: (json['percent'] as num?)?.toDouble(),
      loanMonths: json['loanMonths'] as int?,
      paymentDay: json['paymentDay'] as int?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$LoanModelToJson(LoanModel instance) => <String, dynamic>{
      'product_name': instance.product_name,
      'take_date': _$JsonConverterToJson<String, DateTime>(
          instance.take_date, const CustomDateTimeConverter().toJson),
      'currency': instance.currency,
      'holidays': instance.holidays
          .map(const CustomDateTimeConverter().toJson)
          .toList(),
      'workDays': instance.workDays
          .map(const CustomDateTimeConverter().toJson)
          .toList(),
      'amount': instance.amount,
      'percent': instance.percent,
      'loanMonths': instance.loanMonths,
      'paymentDay': instance.paymentDay,
      'isExpanded': instance.isExpanded,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
