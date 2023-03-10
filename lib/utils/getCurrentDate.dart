class DateUtil {
  static DateTime getCurrentDate() {
    // DateTime now = DateTime.now();
    // return DateTime(now.year, now.month, now.day);
    return getFormattedDate(DateTime.now());
  }

  static DateTime getFormattedDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
