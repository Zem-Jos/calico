import 'package:calico/controllers/chat_session_controller.dart';
import 'package:calico/controllers/mood_controller.dart';
import 'package:calico/utils/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/chat_session_model.dart';
import 'authentication_controller.dart';

class CalendarController extends GetxController {
  static CalendarController instance = Get.put(CalendarController());
  final _db = FirebaseFirestore.instance;

  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateUtil.getCurrentDate().obs;
  Rx<DateTime?> selectedDay = DateUtil.getCurrentDate().obs;

  Rx<String> selectedMood = ''.obs;
  RxList<ChatMessage> selectedMessages = <ChatMessage>[].obs;

  @override
  onInit() {
    super.onInit();
    fetchSelectedData();
  }

  void selectDay(DateTime day) {
    selectedDay.value = day;
    update();
  }

  void selectCalendarFormat(CalendarFormat format) {
    calendarFormat.value = format;

    if (calendarFormat.value != format) {
      calendarFormat.value = format;
      update();
    }
  }

  void setFocusedDay(DateTime day) {
    focusedDay.value = day;
    update();
  }

  void clearDay() {
    focusedDay.value = DateUtil.getCurrentDate();
    update();
  }

  Future<void> updateData(DateTime date) async {
    // fetch mood and messages
    final List<ChatMessage>? messages =
        await ChatSessionController.instance.getChatMessagesByDate(date);

    // fetch mood
    final String mood = await MoodController.instance.getMoodByDate(date);

    selectedMood.value = mood;
    selectedMessages.value = messages ?? [];
    update();
  }

  Future<void> fetchSelectedData() async {
    // fetch mood and messages
    final DateTime formattedDate =
        DateUtil.getFormattedDate(selectedDay.value!);

    updateData(formattedDate);
    update();
  }
}
