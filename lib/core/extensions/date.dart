import 'package:intl/intl.dart';

extension IsSameDay on DateTime {
  bool isSameDay(DateTime dt) {
    return day == dt.day && month == dt.month && year == dt.year;
  }
}

extension ToFormattedString on DateTime {
  String toFormattedString() {
    return DateFormat("dd-MM-yyy").format(this);
  }
}
