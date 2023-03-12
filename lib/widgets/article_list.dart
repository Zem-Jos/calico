import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return GestureDetector(
      onTap: () {
        Get.to(ArticleScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: _colorController.getContainerColor(),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Container(
            width: double.infinity,
            height: 90,
            child: Row(
              children: [
                Image.asset('assets/images/test.png'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.56,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              '5 Hal yang dapat membantu kecemasanmu!',
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: _colorController.getTextColor(),
                              ),
                              softWrap: true,
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '5 Menit • oleh Anonymous',
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: grayColor,
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
