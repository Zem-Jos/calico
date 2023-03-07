import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodBoard extends StatelessWidget {
  const MoodBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();
    final ColorController _colorController = Get.put(ColorController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _colorController.getContainerColor(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Image.asset(
                width: 52,
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/senang_dark.png'
                    : 'assets/images/mood/senang.png',
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/biasa_dark.png'
                    : 'assets/images/mood/biasa.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/sedih_dark.png'
                    : 'assets/images/mood/sedih.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/marah_dark.png'
                    : 'assets/images/mood/marah.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/cemas_dark.png'
                    : 'assets/images/mood/cemas.png',
                width: 52,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/lelah_dark.png'
                    : 'assets/images/mood/lelah.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/kecewa_dark.png'
                    : 'assets/images/mood/kecewa.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/takut_dark.png'
                    : 'assets/images/mood/takut.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/hampa_dark.png'
                    : 'assets/images/mood/hampa.png',
                width: 52,
              ),
              Image.asset(
                _themeController.isDarkMode.value
                    ? 'assets/images/mood/semangat_dark.png'
                    : 'assets/images/mood/semangat.png',
                width: 52,
              ),
            ],
          )
        ],
      ),
    );
  }
}
