import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static final DateUtil instance = DateUtil();

  DateUtil() {
    init();
  }

  static DateTime getCurrentDate() {
    // DateTime now = DateTime.now();
    // return DateTime(now.year, now.month, now.day);
    return getFormattedDate(DateTime.now());
  }

  static DateTime getFormattedDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  String getFormattedDateStr(DateTime date) {
    final format =
        DateFormat('dd MMMM yyyy', 'id_ID'); // 'id' for Indonesian language
    final result = format.format(date);

    return result;
  }

  void init() async {
    await initializeDateFormatting('id_ID', null);
  }
}
