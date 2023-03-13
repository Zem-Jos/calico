import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, Color> categories = {
  'Stress': Color(0xffF1A69A),
  'Kecemasan': Color(0xffD5C5F5),
  'Motivasi Diri': Color(0xffFFD481),
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
      onTap: () => Get.to(() => CategoryScreen(), arguments: category),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/category/${category}.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                category == 'Motivasi Diri'
                    ? 'MOTIVASI\nDIRI'
                    : category == 'Strategi Coping'
                        ? 'STRATEGI\nCOPING'
                        : category.toUpperCase(),
                style: GoogleFonts.roboto(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 0),
                        blurRadius: 20,
                      ),
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
