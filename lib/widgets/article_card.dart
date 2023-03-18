import 'package:calico/controllers/article_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/models/article_model.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/article_screen.dart';
import 'article_image.dart';

class ArticleCard extends StatelessWidget {
  final ArticleModel article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final ArticleController articleController = Get.find();
    final ColorController colorController = Get.put(ColorController());

    return GestureDetector(
      onTap: () {
        articleController.fetchMarkdownFile(article.content);
        Get.to(() => ArticleScreen(
              article: article,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Container(
          decoration: BoxDecoration(
            color: colorController.getContainerColor(),
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
                    child: article.imageUrl != null
                        ? ArticleImage(
                            imageUrl: article.imageUrl!,
                            width: 243,
                            height: 135,
                          )
                        : Image.asset(
                            'assets/images/article/article-default.png',
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
                        article.title,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: colorController.getTextColor(),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${article.category} • 5 Menit',
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
      ),
    );
  }
}
