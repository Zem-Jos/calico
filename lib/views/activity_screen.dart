import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/article_card.dart';
import 'package:calico/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calico/widgets/category_card.dart';

class ActivityScreen extends StatelessWidget {
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: _themeController.isDarkMode.value
                    ? darkBackground
                    : whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
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
              SizedBox(
                height: 11,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 218),
                child: Expanded(
                  child: ListView(
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ArticleCard(),
                      ArticleCard(),
                      SizedBox(
                        width: 24,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GridView.builder(
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
