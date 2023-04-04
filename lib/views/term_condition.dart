import 'package:calico/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calico/theme.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    final ThemeController _themeController = Get.put(ThemeController());
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: _colorController.getTextColor()),
        title: Text(
          'Ketentuan Penggunaan',
          style: GoogleFonts.rubik(
            color: _colorController.getTextColor(),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: Column(
          children: [
            Markdown(
              selectable: true,
              padding: const EdgeInsets.only(bottom: 20),
              data: 'assets/tnc.md',
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              styleSheet: MarkdownStyleSheet(
                p: GoogleFonts.rubik(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: _colorController.getTextColor(),
                ),
                h1: GoogleFonts.rubik(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                h2: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                h3: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                h4: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                h5: GoogleFonts.rubik(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                h6: GoogleFonts.rubik(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                em: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: _colorController.getTextColor(),
                ),
                strong: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _colorController.getTextColor(),
                ),
                blockquote: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: _colorController.getTextColor(),
                ),
                code: GoogleFonts.rubik(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: _colorController.getTextColor(),
                ),
                codeblockDecoration: BoxDecoration(
                  color: _colorController.getContainerColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
