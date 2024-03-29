import 'package:calico/controllers/article_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../models/article_model.dart';
import '../widgets/article_image.dart';

class ArticleScreen extends StatelessWidget {
  final ArticleController articleController = Get.find();
  final ArticleModel article;

  ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());
    return Scaffold(
      backgroundColor: colorController.getContainerColor(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: colorController.getTextColor()),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: GoogleFonts.rubik(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: colorController.getTextColor(),
                ),
                softWrap: true,
                maxLines: 3,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${article.readTime} Menit • oleh ${article.author.isEmpty ? 'Anonim' : article.author}',
                style: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: grayColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Image.asset('assets/images/test2.png'),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: article.imageUrl != null
                    ? ArticleImage(
                        imageUrl: article.imageUrl!,
                      )
                    : Image.asset(
                        'assets/images/article/article-default.png',
                      ),
              ),

              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: GetBuilder<ArticleController>(
                  builder: (controller) {
                    if (controller.isLoading.value) {
                      // return const Center(
                      //   child: CircularProgressIndicator(),
                      // );
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ShimmerArticleText(),
                      );
                    }
                    return Markdown(
                      selectable: true,
                      padding: const EdgeInsets.only(bottom: 20),
                      data: controller.selectedMarkdownFile.value,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      styleSheet: MarkdownStyleSheet(
                        p: GoogleFonts.rubik(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: colorController.getTextColor(),
                        ),
                        h1: GoogleFonts.rubik(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        h2: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        h3: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        h4: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        h5: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        h6: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        em: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: colorController.getTextColor(),
                        ),
                        strong: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorController.getTextColor(),
                        ),
                        blockquote: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: colorController.getTextColor(),
                        ),
                        code: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: colorController.getTextColor(),
                        ),
                        codeblockDecoration: BoxDecoration(
                          color: colorController.getContainerColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
