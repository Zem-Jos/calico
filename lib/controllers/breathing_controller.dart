import 'dart:async';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:get/get.dart';

class BreathingController extends GetxController {
  RxBool isExpanded = false.obs;
  RxBool isHold = false.obs;
  RxBool isStarted = false.obs;
  RxInt iteration = 0.obs;

  void onTap() {
    if (iteration.value < 7) {
      isStarted.value = true;
      isExpanded.value = true;
      // After 4 seconds, set the _isExpanded flag to false to trigger the hold animation
      Future.delayed(const Duration(seconds: 4), () {
        isHold.value = true;
      });
      // After 7 seconds, set the _isHold flag to false to trigger the shrink animation
      Future.delayed(const Duration(seconds: 11), () {
        isHold.value = false;
        isExpanded.value = false;
      });
      // After 8 seconds, set the _isExpanded flag to true to trigger the hold animation
      Future.delayed(const Duration(seconds: 19), () {
        onTap();
        iteration.value++;
      });
    }
  }

  Timer? timer;
  final count = 0.obs;
  final progress = 0.0.obs;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (count.value >= 152) {
        t.cancel();
        Get.offAll(const NavigationPage());
      } else {
        count.value += 1;
        progress.value = count.value / 152;
      }
    });
  }

  int getMinutes() {
    return (count.value / 60).floor();
  }

  int getSeconds() {
    return count.value % 60;
  }

  void resetTimer() {
    count.value = 0;
    progress.value = 0.0;
    timer?.cancel();
  }

  @override
  void onClose() {
    super.onClose();
    isExpanded.close();
  }
}
