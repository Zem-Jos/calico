import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 66,
          ),
          Container(
            width: double.infinity,
            height: 250,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: _colorController.getContainerColor(),
                  ),
                  width: 243,
                  height: 250,
                  margin: EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/article/article.png',
                        width: 243,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '5 Hal yang dapat membantu kecemasanmu!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _colorController.getTextColor(),
                              ),
                            ),
                            Text(
                              'Kecemasan',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: grayColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: _colorController.getContainerColor(),
                  ),
                  width: 243,
                  height: 250,
                  margin: EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/article/article.png',
                        width: 243,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '5 Hal yang dapat membantu kecemasanmu!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _colorController.getTextColor(),
                              ),
                            ),
                            Text(
                              'Kecemasan',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: grayColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: _colorController.getContainerColor(),
                  ),
                  width: 243,
                  height: 250,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/article/article.png',
                        width: 243,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '5 Hal yang dapat membantu kecemasanmu!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: _colorController.getTextColor(),
                              ),
                            ),
                            Text(
                              'Kecemasan',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: grayColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
