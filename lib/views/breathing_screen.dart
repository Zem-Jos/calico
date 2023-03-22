import 'package:calico/controllers/breathing_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BreathingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    final BreathingController _breathingController =
        Get.put(BreathingController());

    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: brownColor),
        title: Text(
          'Latihan Pernafasan 4-7-8',
          style: GoogleFonts.rubik(
            color: _colorController.getTextColor(),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => GestureDetector(
                onTap: () {
                  _breathingController.onTap();
                },
                child: Stack(
                  children: [
                    Container(
                      width: 267,
                      height: 267,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0x4dE1A071),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: AnimatedContainer(
                              duration: Duration(
                                  seconds: _breathingController.isExpanded.value
                                      ? 4
                                      : 8),
                              width: _breathingController.isExpanded.value
                                  ? 267
                                  : 115,
                              height: _breathingController.isExpanded.value
                                  ? 267
                                  : 115,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x4dE1A071),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                                width: 115,
                                height: 115,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: brownColor,
                                ),
                                child: Center(
                                  child: Text(
                                      _breathingController.isStarted.value
                                          ? _breathingController.isHold.value
                                              ? 'TAHAN'
                                              : _breathingController
                                                      .isExpanded.value
                                                  ? 'TARIK'
                                                  : 'HEMBUSKAN'
                                          : 'MULAI',
                                      // 'INHALE',
                                      style: GoogleFonts.rubik(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      )),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 94,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              child: Obx(() {
                double value =
                    _breathingController.currentTime.value.inSeconds /
                        _breathingController.totalDuration.value.inSeconds;
                return Slider(
                  activeColor: blackColor,
                  inactiveColor: grayColor,
                  value: value,
                  min: 0,
                  max: 100,
                  onChanged: (_) {},
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
