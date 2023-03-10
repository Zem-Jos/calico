import 'package:calico/controllers/mood_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  MoodController _moodController = Get.put(MoodController());
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _colorController.getBackgroundColor(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: edge),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff433230).withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    color: _colorController.getContainerColor(),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          const SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            'assets/images/icon/avatar.png',
                            width: 45,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SadGirl21',
                                style: GoogleFonts.rubik(
                                    fontSize: 22, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'user51267839120',
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: grayColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(SettingsScreen());
                        },
                        icon: Image.asset(
                          'assets/images/icon/settings.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _colorController.getContainerColor(),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff433230).withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    locale: 'en_US',
                    firstDay:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    calendarStyle: CalendarStyle(
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
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    // Obx(
                    //   () {
                    //     return Container(
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 15, horizontal: 16),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: _colorController.getContainerColor(),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Color(0xff433230).withOpacity(0.15),
                    //             spreadRadius: 0,
                    //             blurRadius: 12,
                    //             offset:
                    //                 Offset(0, 4), // changes position of shadow
                    //           ),
                    //         ],
                    //       ),
                    //       child: Row(children: [
                    //         Image.asset(
                    //           'assets/images/mood/${_moodController.selectedMood.toString()}_icon.png',
                    //           width: 35,
                    //         ),
                    //         SizedBox(width: 16),
                    //         Text(
                    //           'Hari ini anda merasa ${_moodController.selectedMood.toString()}',
                    //           style: GoogleFonts.rubik(
                    //               fontSize: 17,
                    //               color: _colorController.getTextColor()),
                    //         ),
                    //       ]),
                    //     );
                    //   },
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: _colorController.getContainerColor(),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff433230).withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(children: [
                        Image.asset(
                          'assets/images/icon/paw.png',
                          width: 35,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Percakapan dengan Calico',
                              style: GoogleFonts.rubik(
                                  fontSize: 17,
                                  color: _colorController.getTextColor()),
                            ),
                            Text(
                              '02.17 AM',
                              style: GoogleFonts.rubik(
                                  fontSize: 12, color: grayColor),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
