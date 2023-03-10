import 'package:calico/controllers/mood_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodBoard extends StatefulWidget {
  const MoodBoard({super.key});

  @override
  State<MoodBoard> createState() => _MoodBoardState();
}

class _MoodBoardState extends State<MoodBoard> {
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();
    final ColorController _colorController = Get.put(ColorController());
    final MoodController _moodController = Get.put(MoodController());

    return Container(
      width: double.infinity,
      // height: MediaQuery.of(context).size.height * 0.22,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _colorController.getContainerColor(),
      ),
      child: GetBuilder<MoodController>(
        builder: (controller) {
          return controller.selectedMood.value.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'mood',
                        child: Image.asset(
                          _themeController.isDarkMode.value
                              ? 'assets/images/mood/${_moodController.selectedMood()}_dark.png'
                              : 'assets/images/mood/${_moodController.selectedMood()}.png',
                          width: 70,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.52,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yay! Manfaatkan hari yang indah ini sebaik mungkin',
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _moodController.clearMood();
                                });
                              },
                              child: Text(
                                'Lihat statistik',
                                style: GoogleFonts.rubik(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bagaimana Suasana Hatimu Hari Ini?',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        color: _colorController.getTextColor(),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('senang');
                            });
                          },
                          child: Image.asset(
                            width: 52,
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/senang_dark.png'
                                : 'assets/images/mood/senang.png',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('biasa');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/biasa_dark.png'
                                : 'assets/images/mood/biasa.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('sedih');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/sedih_dark.png'
                                : 'assets/images/mood/sedih.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('marah');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/marah_dark.png'
                                : 'assets/images/mood/marah.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('cemas');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/cemas_dark.png'
                                : 'assets/images/mood/cemas.png',
                            width: 52,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('lelah');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/lelah_dark.png'
                                : 'assets/images/mood/lelah.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('kecewa');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/kecewa_dark.png'
                                : 'assets/images/mood/kecewa.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('takut');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/takut_dark.png'
                                : 'assets/images/mood/takut.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('hampa');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/hampa_dark.png'
                                : 'assets/images/mood/hampa.png',
                            width: 52,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _moodController.selectMood('semangat');
                            });
                          },
                          child: Image.asset(
                            _themeController.isDarkMode.value
                                ? 'assets/images/mood/semangat_dark.png'
                                : 'assets/images/mood/semangat.png',
                            width: 52,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
