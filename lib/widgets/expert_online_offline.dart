import 'package:calico/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertOnlineOffline extends StatelessWidget {
  double fontSize;
  ExpertOnlineOffline({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            color: _colorController.getBackgroundColor(),
            child: Text(
              'Offline',
              style: GoogleFonts.rubik(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: _colorController.getTextColor()),
            ),
          ),
        ),
        SizedBox(
          width: 3,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            color: _colorController.getBackgroundColor(),
            child: Text(
              'Online',
              style: GoogleFonts.rubik(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: _colorController.getTextColor()),
            ),
          ),
        )
      ],
    );
  }
}
