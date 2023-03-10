import 'package:get/get.dart';

class MoodController extends GetxController {

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

  void selectMood(String mood) {
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
