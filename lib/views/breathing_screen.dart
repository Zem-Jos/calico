import 'package:calico/controllers/breathing_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:audioplayers/audioplayers.dart';

class BreathingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    final BreathingController _breathingController =
        Get.put(BreathingController());
    final circleWidth = MediaQuery.of(context).size.width * 0.68;
    final smallCircleWidth = MediaQuery.of(context).size.width * 0.29;
    final AudioPlayer _audioPlayer = AudioPlayer();
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: brownColor),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Obx(
            () => GestureDetector(
              onTap: () {
                _breathingController.isStarted.value
                    ? null
                    : _breathingController.onTap();
                _breathingController.startTimer();
                // _audioPlayer.setSourceAsset('audio/breathing.mp3');
                // _audioPlayer.play();
              },
              child: Stack(
                children: [
                  Container(
                    width: circleWidth,
                    height: circleWidth,
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
                                ? circleWidth
                                : smallCircleWidth,
                            height: _breathingController.isExpanded.value
                                ? circleWidth
                                : smallCircleWidth,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0x4dE1A071),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                              width: smallCircleWidth,
                              height: smallCircleWidth,
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
                                      fontSize: 15,
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
          // const SizedBox(
          //   height: 94,
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Obx(
              () => Column(children: [
                LinearPercentIndicator(
                  lineHeight: 8.0,
                  percent: _breathingController.progress.value,
                  backgroundColor: grayColor,
                  progressColor: blackColor,
                  barRadius: const Radius.circular(5),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        '0${_breathingController.getMinutes()}:${_breathingController.getSeconds() > 9 ? _breathingController.getSeconds() : '0${_breathingController.getSeconds()}'}'),
                    const Spacer(),
                    const Text('02:32'),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
