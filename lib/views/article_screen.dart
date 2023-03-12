import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
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
              '5 Hal yang dapat membantu kecemasanmu!',
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
            SizedBox(
              height: 30,
            ),
            Image.asset('assets/images/test2.png'),
            SizedBox(
              height: 30,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur\n\nadipiscing elit. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut \n\naliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. \n\nSed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nisl sit amet nisl. Sed euismod, nunc ut aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl n',
              style: GoogleFonts.rubik(
                  fontSize: 15, color: _colorController.getTextColor()),
            ),
          ]),
        ),
      )),
    );
  }
}
