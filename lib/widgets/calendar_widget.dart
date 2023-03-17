import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calendar_controller.dart';
import '../controllers/theme_controller.dart';
import '../theme.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CalendarController calendarController = Get.find<CalendarController>();
    final ColorController colorController = Get.put(ColorController());
    // Get.locale = const Locale('id', 'ID');
    final Map<String, String> _calendarLocale = {
      'month': 'Bulan',
      'week': 'Minggu',
      'day': 'Hari',
      'today': 'Hari ini',
      'previous': 'Sebelumnya',
      'next': 'Selanjutnya',
      'Monday': 'Senin',
      'Tuesday': 'Selasa',
      'Wednesday': 'Rabu',
      'Thursday': 'Kamis',
      'Friday': 'Jumat',
      'Saturday': 'Sabtu',
      'Sunday': 'Minggu',
    };

    return GetBuilder<CalendarController>(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorController.getContainerColor(),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff433230).withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Obx(() => TableCalendar(
              // locale: 'id_ID',
              firstDay: DateTime.now().subtract(const Duration(days: 365)),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: calendarController.focusedDay.value,
              calendarFormat: calendarController.calendarFormat.value,
              startingDayOfWeek: StartingDayOfWeek.monday,
              // locale: _calendarLocale,
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                todayDecoration: BoxDecoration(
                  color: lightBrownColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: brownColor,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) {
                return isSameDay(calendarController.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) async {
                if (!isSameDay(
                    calendarController.selectedDay.value, selectedDay)) {
                  calendarController.selectDay(selectedDay);
                  calendarController.setFocusedDay(focusedDay);

                  // fetch data from selected date
                  await calendarController.fetchSelectedData();
                }
              },
              onFormatChanged: (format) {
                calendarController.selectCalendarFormat(format);
              },
              onPageChanged: (focusedDay) {
                calendarController.setFocusedDay(focusedDay);
              },
            )),
      );
    });
  }
}
