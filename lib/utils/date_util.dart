class DateUtil {
  static DateTime getCurrentDate() {
    return getFormattedDate(DateTime.now());
  }

  static DateTime getFormattedDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
