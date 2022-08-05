import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loan_bloc/core/utils/date_time_utils.dart';

part 'loan.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class LoanModel {
  final String? product_name;

  final DateTime? take_date;
  final String? currency;
  final List<DateTime> holidays;
  final List<DateTime> workDays;
  final double? amount;
  final double? percent;
  final int? loanMonths;
  final int? paymentDay;
  bool isExpanded;

  LoanModel({
    this.product_name,
    this.take_date,
    this.currency,
    this.holidays = const [],
    this.workDays = const [],
    this.amount,
    this.percent,
    this.loanMonths,
    this.paymentDay,
    this.isExpanded = false,
  });

  double get monthPayment {
    return (amount! / loanMonths!.toDouble() +
        amount! / loanMonths!.toDouble() * (percent! / 100));
  }

  factory LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoanModelToJson(this);

  List<DateTime> get paymentDays => DateTimeUtils.generatePaymentDates(
        start: take_date ?? DateTime.now(),
        months: loanMonths ?? 0,
        paymentDay: paymentDay ?? 1,
        holidays: holidays,
        workDays: workDays,
      );
}

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  final String format;

  const CustomDateTimeConverter({this.format = "dd.MM.yyyy"});

  @override
  DateTime fromJson(String json) {
    var dateFormat = DateFormat(format);
    return dateFormat.parse(json);
  }

  @override
  String toJson(DateTime json) => json.toIso8601String();
}
