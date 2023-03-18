import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/chat_recap_screen.dart';
import 'package:calico/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/authentication_controller.dart';
import '../controllers/calendar_controller.dart';
import '../widgets/calendar_widget.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  final CalendarController calendarController = Get.put(CalendarController());
  final ColorController _colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _colorController.getBackgroundColor(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: edge),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff433230).withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset:
                            const Offset(0, 4), // changes position of shadow
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
                                authController.user?.displayName ?? 'Tamu',
                                style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: _colorController.getTextColor()),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                authController.user?.email ?? 'anonim',
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
                          Get.to(() => const SettingsScreen());
                        },
                        icon: Image.asset(
                          'assets/images/icon/settings.png',
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const CalendarWidget(),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Obx(
                      () {
                        if (calendarController.selectedMood.value == '') {
                          return const SizedBox(
                            height: 0,
                          );
                        } else {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _colorController.getContainerColor(),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff433230).withOpacity(0.15),
                                  spreadRadius: 0,
                                  blurRadius: 12,
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(children: [
                              Image.asset(
                                'assets/images/mood/${calendarController.selectedMood.value.toString()}_icon.png',
                                width: 35,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Hari ini anda merasa ${calendarController.selectedMood.value.toString()}',
                                style: GoogleFonts.rubik(
                                    fontSize: 15,
                                    color: _colorController.getTextColor()),
                              ),
                            ]),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(const ChatRecapScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _colorController.getContainerColor(),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff433230).withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 12,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(children: [
                          Image.asset(
                            'assets/images/icon/paw.png',
                            width: 35,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Percakapan dengan Calico',
                                style: GoogleFonts.rubik(
                                    fontSize: 15,
                                    color: _colorController.getTextColor()),
                              ),
                              Text(
                                '02.17 AM',
                                style: GoogleFonts.rubik(
                                    fontSize: 12, color: grayColor),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios),
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
