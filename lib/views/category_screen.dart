import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/article_list.dart';
import 'package:flutter/material.dart';
import 'package:calico/widgets/category_card.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    final category = Get.arguments;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(children: [
          //
          Image.asset(
            'assets/images/category/${category}.png',
            fit: BoxFit.cover,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Center(
              child: Text(
                // 'KECEMASAN',
                category == 'Motivasi Diri'
                    ? 'MOTIVASI\nDIRI'
                    : category == 'Strategi Coping'
                        ? 'STRATEGI\nCOPING'
                        : category!.toUpperCase(),
                style: GoogleFonts.roboto(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
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
          ),
          Positioned(
            top: 40,
            left: 0,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: _colorController.getTextColor(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.67,
              minChildSize: 0.67,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    color: _colorController.getContainerColor(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              controller: scrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 14);
                              },
                              itemBuilder: (context, index) {
                                return const ArticleList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
