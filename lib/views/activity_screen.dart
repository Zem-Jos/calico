import 'package:calico/controllers/article_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/article_card.dart';
import 'package:calico/widgets/category_card.dart';
import 'package:calico/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityScreen extends StatelessWidget {
  final ArticleController articleController = Get.put(ArticleController());
  ActivityScreen({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorController.getActivityBackgroundColor(),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: brownColor,
        flexibleSpace: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: _themeController.isDarkMode.value
                    ? darkBackground
                    : whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 43,
              child: TextFormField(
                style: GoogleFonts.rubik(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: _colorController.getTextColor(),
                ),
                cursorColor: brownColor,
                // controller: messageController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: grayColor,
                  ),
                  border: InputBorder.none,
                  labelText: null,
                  hintText: 'Cari artikel',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                ),
                maxLines: null,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Artikel Pilihan',
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _colorController.getTextColor()),
                    ),
                    Text(
                      'Pahami topik kesehatan mental dengan lebih baik.',
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: grayColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 272),
                child: GetBuilder<ArticleController>(
                  builder: (controller) {
                    if (controller.isLoading.value == true) {
                      // show shimmer loading effect
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            3, // you can adjust this number to show more or fewer shimmers
                        itemBuilder: (context, index) {
                          return const ShimmerArticleCard();
                        },
                      );
                    } else {
                      return ListView.separated(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.recommendedArticles.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        itemBuilder: (context, index) {
                          if (controller.recommendedArticles[index] == null) {
                            // return empty widget
                            return const SizedBox.shrink();
                          }
                          return ArticleCard(
                            article: controller.recommendedArticles[index]!,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Kategori',
                  style: GoogleFonts.rubik(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _colorController.getTextColor()),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GridView.builder(
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String category = categories.keys.elementAt(index);
                    Color color = categories.values.elementAt(index);
                    return CategoryCard(
                        category: category, backgroundColor: color);
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
