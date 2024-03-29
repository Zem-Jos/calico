import 'package:calico/controllers/calendar_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../utils/date_util.dart';
import 'authentication_controller.dart';

class MoodController extends GetxController {
  static MoodController instance = Get.put(MoodController());
  final _db = FirebaseFirestore.instance;
  Rx<String> selectedMood = ''.obs;

  @override
  onInit() {
    super.onInit();
    getMood();
  }

  Future<void> getMood() async {
    final ref = _db
        .collection("moods")
        .where("date", isEqualTo: Timestamp.fromDate(DateUtil.getCurrentDate()))
        .where("userId", isEqualTo: AuthController.instance.user!.uid);

    QuerySnapshot querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      // create new mood
      createMoodDb('', DateUtil.getCurrentDate());
      selectedMood.value = '';
      update();
    } else {
      // update mood
      selectedMood.value = querySnapshot.docs.first['mood'];
      update();
    }
  }

  Future<String> getMoodByDate(DateTime date) async {
    final ref = _db
        .collection("moods")
        .where("date", isEqualTo: Timestamp.fromDate(date))
        .where("userId", isEqualTo: AuthController.instance.user!.uid);

    QuerySnapshot querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      return '';
    } else {
      return querySnapshot.docs.first['mood'];
    }
  }

  Future<void> selectMood(String mood) async {
    selectedMood.value = mood;

    // update db
    await postDb(mood, DateUtil.getCurrentDate());
  }

  Future<void> clearMood() async {
    selectedMood.value = '';

    // update db
    await postDb('', DateUtil.getCurrentDate());
  }

  Future<void> postDb(String mood, DateTime date) async {
    // find if there is a mood for this date
    final ref = _db
        .collection("moods")
        .where("date", isEqualTo: Timestamp.fromDate(date))
        .where("userId", isEqualTo: AuthController.instance.user!.uid);

    QuerySnapshot querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      // create new mood
      createMoodDb(mood, date);
    } else {
      // update mood
      updateMoodDb(mood, querySnapshot.docs.first.id);
    }
    Get.find<CalendarController>().updateData(date);
  }

  Future<void> updateMoodDb(String mood, String id) async {
    await _db.collection('moods').doc(id).update({
      "mood": mood,
    }).whenComplete(() {
      print("Successfully update mood!");
    }).catchError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<void> createMoodDb(String mood, DateTime date) async {
    await _db.collection('moods').add({
      "mood": mood,
      "date": Timestamp.fromDate(date),
      "userId": AuthController.instance.user!.uid,
    }).whenComplete(() {
      print("Successfully create mood!");
    }).catchError((error, stackTrace) {
      print(error.toString());
    });
  }
}
