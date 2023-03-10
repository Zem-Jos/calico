import 'package:get/get.dart';

class MoodController extends GetxController {
  var selectedMood = ''.obs;

  void selectMood(String mood) {
    selectedMood.value = mood;
  }
}
