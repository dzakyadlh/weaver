import 'package:intl/intl.dart';

class DateFormatter {
  /// Format to "HH:mm" (example: "08:30")
  static String toHourMinute(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// Format to "d MMMM yyyy" (example: "15 April 2025")
  static String toDayMonthYear(DateTime dateTime) {
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  /// Format to "d MMM" (example: "15 Apr")
  static String toDayMonth(DateTime dateTime) {
    return DateFormat('d MMM').format(dateTime);
  }

  /// Format to "EEEE, d MMMM yyyy" (example: "Tuesday, 15 April 2025")
  static String toFullDate(DateTime dateTime) {
    return DateFormat('EEEE, d MMMM yyyy').format(dateTime);
  }

  /// Format to "MMM d, yyyy" (example: "Apr 15, 2025")
  static String toShortMonthDateYear(DateTime dateTime) {
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  /// Format to relative time (optional): like "5 minutes ago" (if you want)
}
