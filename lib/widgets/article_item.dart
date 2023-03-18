import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/article_controller.dart';
import '../models/article_model.dart';
import 'article_image.dart';

class ArticleItem extends StatelessWidget {
  final ArticleController articleController = Get.find();
  final ArticleModel article;

  ArticleItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());
    return GestureDetector(
      onTap: () {
        articleController.fetchMarkdownFile(article.content);
        Get.to(() => ArticleScreen(
              article: article,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorController.getContainerColor(),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: SizedBox(
            width: double.infinity,
            height: 90,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: article.imageUrl != null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: double.infinity,
                          child: ArticleImage(
                            imageUrl: article.imageUrl!,
                            width: MediaQuery.of(context).size.width * 0.23,
                            height: double.infinity,
                          ),
                        )
                      : Image.asset(
                          'assets/images/article/article-default.png',
                          width: MediaQuery.of(context).size.width * 0.23,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.56,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              article.title,
                              style: GoogleFonts.rubik(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: colorController.getTextColor(),
                              ),
                              softWrap: true,
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${article.readTime} Menit • oleh ${article.author}',
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

class ArticleItemShimmer extends StatelessWidget {
  const ArticleItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());
    return GestureDetector(
      onTap: () {
        // Get.to(ArticleScreen());
      },
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.grey[300]!,
            Colors.grey[100]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        period: const Duration(seconds: 3),
        direction: ShimmerDirection.ltr,
        child: Container(
          decoration: BoxDecoration(
            color: colorController.getContainerColor(),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            height: 90,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/images/article/article-default.png',
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
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
                              color: colorController.getTextColor(),
                            ),
                            softWrap: true,
                            maxLines: 3,
                          ),
                        ),
                        const SizedBox(
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
