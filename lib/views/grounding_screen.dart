import 'package:calico/controllers/grounding_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GroundingScreen extends StatefulWidget {
  const GroundingScreen({super.key});

  @override
  State<GroundingScreen> createState() => _GroundingScreenState();
}

class _GroundingScreenState extends State<GroundingScreen> {
  final ColorController _colorController = Get.put(ColorController());
  final GroundingController _groundingController =
      Get.put(GroundingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: _colorController.getTextColor()),
        title: Text(
          'Teknik Grounding',
          style: GoogleFonts.rubik(
            color: _colorController.getTextColor(),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: edge),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 120,
                lineWidth: 15,
                backgroundColor: Color(0xffEDBA92),
                progressColor: brownColor,
                percent: _groundingController
                    .groundingPercentage[_groundingController.getIndex()],
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 1200,
                center: Center(
                  child: Image.asset(
                    _groundingController
                        .groundingIcon[_groundingController.getIndex()],
                    width: 110,
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Text(
                _groundingController
                    .groundingTitle[_groundingController.getIndex()],
                style: GoogleFonts.rubik(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _colorController.getTextColor(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _groundingController
                    .groundingDescription[_groundingController.getIndex()],
                style: GoogleFonts.rubik(color: grayColor, fontSize: 15),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  _groundingController.index < 5
                      ? _groundingController.updateIndex()
                      : Get.offAll(NavigationPage());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: brownColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      _groundingController.index != 5 ? 'Lanjut' : 'Kembali',
                      style: GoogleFonts.rubik(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
