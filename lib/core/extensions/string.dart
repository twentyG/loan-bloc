import 'package:intl/intl.dart';

extension ToDateTime on String {
  DateTime toDateTime() {
    return DateFormat("dd.MM.yyyy").parse(this);
  }
}
