/// app_formatters.dart
///
/// Centralized formatters for dates, numbers and other values.
import 'package:intl/intl.dart';

class AppFormatters {
  AppFormatters._();

  static String formatShortDate(DateTime date) => DateFormat.yMMMd().format(date);
  static String formatTime(DateTime date) => DateFormat.Hm().format(date);
}

