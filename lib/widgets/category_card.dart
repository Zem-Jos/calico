import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/views/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Color> categories = {
  'Stress': Color(0xffF1A69A),
  'Kecemasan': Color(0xffD5C5F5),
  'Motivasi': Color(0xffFFD481),
  'Tidur': Color(0xff95B2DF),
  'Depresi': Color(0xff9897D1),
  'Mindfulness': Color(0xffBBF6DA),
  'Strategi Coping': Color(0xffFFCEA1),
  'Hubungan': Color(0xffFDCCDE)
};

class CategoryCard extends StatelessWidget {
  String category;
  Color backgroundColor;

  CategoryCard({required this.category, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return GestureDetector(
      onTap: () => Get.to(() => CategoryScreen()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 160,
          height: 140,
          color: backgroundColor,
          child: Center(
            child: Text(
              category,
              style: GoogleFonts.rubik(
                color: _colorController.getTextColor(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
