import 'package:calico/controllers/article_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String _markdownData = '';
  Future<void> _loadMarkdownFile() async {
    final String markdownData =
        await rootBundle.loadString('assets/article.md');

    setState(() {
      _markdownData = markdownData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    // final ArticleController _articleController = Get.put(ArticleController());
    _loadMarkdownFile();
    // final _markdownData = _articleController.articles;
    return Scaffold(
      backgroundColor: _colorController.getContainerColor(),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: _colorController.getTextColor(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Manajemen Emosi dengan Teknik Reframing',
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: _colorController.getTextColor(),
              ),
              softWrap: true,
              maxLines: 3,
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
            ),
            const SizedBox(
              height: 30,
            ),
            // Image.asset('assets/images/test2.png'),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/article/article-default.png',
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Markdown(
                selectable: true,
                padding: EdgeInsets.only(bottom: 20),
                data: _markdownData,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
