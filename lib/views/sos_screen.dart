import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/grounding_screen.dart';
import 'package:calico/views/sos_professional_screen.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Container(
            height: 65,
            color: Colors.transparent,
            padding: EdgeInsets.only(right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offAll(NavigationPage());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Apakah kamu dalam keadaan darurat?',
                style: GoogleFonts.rubik(
                  color: _colorController.getTextColor(),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Kamu tidak sendiri. Dapatkan bantuan hanya dalam satu panggilan. ',
                style: GoogleFonts.rubik(
                  color: _colorController.getTextColor(),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Meminta bantuan bukan berarti kamu lemah.',
                style: GoogleFonts.rubik(
                  color: _colorController.getTextColor(),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(GroundingScreen());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.5,
                      color: redColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                        child: Text(
                      'Coba Teknik Grounding',
                      style: GoogleFonts.rubik(
                        color: redColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SosProfessionalScreen());
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.5,
                      color: redColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                        child: Text(
                      'Bantuan Profesional',
                      style: GoogleFonts.rubik(
                        color: whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
