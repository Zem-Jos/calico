import 'package:calico/controllers/mood_controller.dart';
import 'package:calico/utils/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../api/cloudfunction_api.dart';
import '../models/chat_session_model.dart';
import '../models/summary_model.dart';
import 'authentication_controller.dart';

class CalendarController extends GetxController {
  static CalendarController instance = Get.put(CalendarController());
  final _db = FirebaseFirestore.instance;

  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateUtil.getCurrentDate().obs;
  Rx<DateTime?> selectedDay = DateUtil.getCurrentDate().obs;

  Rx<String> selectedMood = ''.obs;
  RxList<ChatMessage> selectedMessages = <ChatMessage>[].obs;

  RxString selectedSummary = ''.obs;

  RxBool isLoading = false.obs;

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

  Future<void> fetchSelectedData() async {
    // fetch mood and messages
    final DateTime formattedDate =
        DateUtil.getFormattedDate(selectedDay.value!);

    updateData(formattedDate);
    update();
  }

  Future<void> updateData(DateTime date) async {
    try {
      isLoading.value = true;
      update();
      // fetch messages
      final List<ChatMessage>? messages = await getChatMessagesByDate(date);

      // fetch mood
      final String mood = await MoodController.instance.getMoodByDate(date);

      selectedMood.value = mood;
      selectedMessages.value = messages ?? [];
    } catch (e) {
      Get.snackbar("Error Loading Data History", "error: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<List<ChatMessage>?> getChatMessagesByDate(DateTime date) async {
    ChatSession? chatSession = await findChatSession(date);

    if (chatSession == null) {
      return null;
    }

    return chatSession.messages;
  }

  Future<ChatSession?> findChatSession(DateTime session) async {
    final ref = _db
        .collection("chatSessions")
        .where("firebaseSession", isEqualTo: Timestamp.fromDate(session))
        .where("userId", isEqualTo: AuthController.instance.user!.uid);

    final querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      return null;
    }

    ChatSession chatSession =
        ChatSession.fromFirestore(snapshot: querySnapshot.docs.first);
    return chatSession;
  }

  Future<void> findChatSummary() async {
    try {
      isLoading(true);
      update();

      // fetch chat session
      ChatSession? chatSession =
          await findChatSession(DateUtil.getFormattedDate(selectedDay.value!));

      if (chatSession == null) {
        throw Exception("Chat session not found.");
      }

      // if chat session has summary set summary
      if (chatSession.summary != null) {
        selectedSummary.value = chatSession.summary!;
        return;
      }

      // if chat session doesn't have summary fetch summary from cloud function
      SummaryResponse? response = await fetchChatSummary();

      if (response == null) {
        throw Exception("Chat summary not found.");
      }
      //  update chat session summary in firestore
      var ref = _db.collection("chatSessions").doc(chatSession.id);

      await ref.update({"summary": response.summary});

      // set summary
      selectedSummary.value = response.summary;
    } catch (e) {
      Get.snackbar("Error fetching chat summary", "error: $e");
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<SummaryResponse?> fetchChatSummary() async {
    SummaryResponse? response = await CloudFunctionApi.instance.fetchSummary(
        AuthController.instance.user!.uid,
        DateUtil.getFormattedDate(selectedDay.value!));

    if (response == null) {
      throw Exception("Chat summary available.");
    }

    return response;
  }

  void clearChatSummary() {
    selectedSummary.value = "";
    update();
  }
}
