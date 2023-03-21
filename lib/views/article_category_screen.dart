import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/article_controller.dart';
import '../widgets/shimmer.dart';

class ArticleCategoryScreen extends StatelessWidget {
  final String category;
  final ArticleController articleController = Get.find();

  ArticleCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());

    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(children: [
          //
          Image.asset(
            'assets/images/category/$category.png',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Center(
              child: Text(
                category == 'Motivasi Diri'
                    ? 'MOTIVASI\nDIRI'
                    : category == 'Strategi Coping'
                        ? 'STRATEGI\nCOPING'
                        : category.toUpperCase(),
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
                color: colorController.getTextColor(),
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
                    color: colorController.getContainerColor(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: GetBuilder<ArticleController>(
                                builder: (controller) {
                              if (controller.isLoading.value == true) {
                                // return const Center(
                                //   child: CircularProgressIndicator(),
                                // );
                                return ShimmerArticleItem();
                              }
                              ;

                              return controller.articlesByCategory.isNotEmpty
                                  ? ListView.separated(
                                      clipBehavior: Clip.none,
                                      controller: scrollController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.articlesByCategory.length,
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(height: 14);
                                      },
                                      itemBuilder: (context, index) {
                                        var article = articleController
                                            .articlesByCategory[index];

                                        if (article == null) {
                                          return const SizedBox();
                                        }

                                        return ArticleItem(
                                          article: article,
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        'Artikel belum tersedia',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                            }),
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
