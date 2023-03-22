import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BreathingController extends GetxController {
  RxBool isExpanded = false.obs;
  RxBool isHold = false.obs;
  RxBool isStarted = false.obs;
  RxInt iteration = 0.obs;
  Rx<Duration> currentTime = Duration(seconds: 0).obs;
  Rx<Duration> totalDuration = Duration(seconds: 152).obs;

  void onTap() async {
    if (iteration.value < 8) {
      isStarted.value = true;
      isExpanded.value = true;
      // After 4 seconds, set the _isExpanded flag to false to trigger the hold animation
      Future.delayed(Duration(seconds: 4), () {
        isHold.value = true;
      });
      // After 7 seconds, set the _isHold flag to false to trigger the shrink animation
      await Future.delayed(Duration(seconds: 7), () {
        isHold.value = false;
        isExpanded.value = false;
      });
      // After 8 seconds, set the _isExpanded flag to true to trigger the hold animation
      await Future.delayed(Duration(seconds: 8), () {
        onTap();
        iteration.value++;
      });
    }
  }

  // var progress = 0.0.obs;
  // Timer? _timer;

  // void startTimer() {
  //   _timer?.cancel();
  //   _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
  //     progress.value = timer.tick / (2 * 60 + 32) * 100;
  //     if (timer.tick >= 2 * 60 + 32 * 1000 / 10) {
  //       timer.cancel();
  //     }
  //   });
  // }

  @override
  void onClose() {
    super.onClose();
    isExpanded.close();
  }
}
