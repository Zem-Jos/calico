import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Container(
        decoration: BoxDecoration(
          color: _colorController.getContainerColor(),
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        width: 243,
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17),
                  ),
                  child: Image.asset(
                    'assets/images/article/article.png',
                    width: 243,
                    height: 135,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '5 Hal yang dapat membantu kecemasanmu!',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: _colorController.getTextColor(),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Kecemasan • 5 Menit',
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: grayColor,
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
