import 'dart:core';

import 'package:loan_bloc/core/extensions/date.dart';


class DateTimeUtils {
  static List<DateTime> generatePaymentDates({
    required DateTime start,
    required int months,
    required int paymentDay,
    required List<DateTime> holidays,
    required List<DateTime> workDays,
  }) {
    var firstPayment = DateTime(start.year, start.month + 1, paymentDay);
    return List.generate(
      months,
      (index) => getNextWorkDate(
        DateTime(
          firstPayment.year,
          firstPayment.month + index,
          firstPayment.day,
        ),
        holidays,
        workDays,
      ),
    );
  }

  static DateTime getNextWorkDate(
      DateTime day, List<DateTime> holidays, List<DateTime> workdays) {
    if (day.weekday == 6 || day.weekday == 7) {
      var workDayAlready = workdays.indexWhere((wD) => wD.isSameDay(day));
      if (workDayAlready >= 0) {
        return day;
      } else {
        return getNextWorkDate(nextDay(day), holidays, workdays);
      }
    }

    var holiday = holidays.indexWhere((hD) => hD.isSameDay(day));
    if (holiday >= 0) {
      return getNextWorkDate(nextDay(day), holidays, workdays);
    }
    return day;
  }

  static DateTime nextDay(DateTime day) {
    return DateTime.fromMillisecondsSinceEpoch(day.millisecondsSinceEpoch)
        .add(const Duration(days: 1));
  }
}
