import 'package:calico/controllers/authentication_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../api/dialogflowcx_api.dart';
import '../models/chat_session_model.dart';
import '../models/dialogflow_response.dart';
import '../utils/date_util.dart';

class ChatSessionController extends GetxController {
  static ChatSessionController instance = Get.put(ChatSessionController());
  late Rx<ChatSession> chatSession = ChatSession(
    id: "test-session-123",
    messages: [],
    session: DateUtil.getCurrentDate(),
    userId: "",
  ).obs;
  RxBool isLoading = false.obs;

  final _db = FirebaseFirestore.instance;
  late final DialogflowCxApi? dialogflow;

  List<ChatMessage> get chatMessages => chatSession.value.messages;

  @override
  onInit() {
    // load chat session
    _loadChatSession();

    super.onInit();
  }

  @override
  onClose() {
    // dispose dialogflow connection
    if (dialogflow == null) return;
    dialogflow!.dispose();

    super.onClose();
  }

  _loadChatSession() async {
    try {
      ChatSession? cs = await getChatSession(DateUtil.getCurrentDate());

      if (cs == null) throw Exception("Failed to load Chat Session");
      if (cs.id == null) throw Exception("Failed to get Chat Session ID");

      print(cs);
      chatSession.value = cs;

      // init dialogflow
      await _initDialogflow(cs.id!);
    } catch (e) {
      // TODO Handle error
      print(e);
    }
  }

  _initDialogflow(String sessionId) async {
    DialogflowCxApi dialogflow = DialogflowCxApi(
      location: dotenv.env['DIALOGFLOW_LOCATION']!,
      agentId: dotenv.env['DIALOGFLOW_AGENT_ID']!,
      languageCode: "id",
      sessionId: sessionId,
    );

    dialogflow.initialize();

    this.dialogflow = dialogflow;
  }

  void sendMessage(ChatMessage message) async {
    try {
      // insert chat message to db
      await insertChatMessage(message);

      if (dialogflow == null) throw Exception("Dialogflow not initialized.");

      var response = await dialogflow!.detectIntent(message.messageContent);

      DialogflowResponse dialogflowResponse =
          DialogflowResponse.fromJson(response);

      // insert responseMessages to chatSession

      print(dialogflowResponse.responseMessages.first.text);

      // insert response to db
    } catch (e) {
      // TODO Handle error
      print(e);
    }
  }

  Future<ChatSession?> getChatSession(DateTime session) async {
    final ref = _db
        .collection("chatSessions")
        .where("firebaseSession", isEqualTo: Timestamp.fromDate(session))
        .where("userId", isEqualTo: AuthController.instance.user!.uid);

    final querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      print("No chat session found!");
      createNewChatSession();
      // return empty ChatSession
      return ChatSession(
          messages: [],
          session: DateUtil.getCurrentDate(),
          userId: AuthController.instance.user!.uid);
    }

    ChatSession chatSession =
        ChatSession.fromFirestore(snapshot: querySnapshot.docs.first);
    return chatSession;
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

  Future<void> createNewChatSession() async {
    ChatSession chatSession = ChatSession(
      messages: [],
      session: DateUtil.getCurrentDate(),
      userId: AuthController.instance.user!.uid,
    );
    await _db
        .collection('chatSessions')
        .add(chatSession.toJson())
        .whenComplete(() {})
        .catchError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<List<ChatMessage>> getChatMessages() async {
    ChatSession? chatSession = await getChatSession(DateUtil.getCurrentDate());

    if (chatSession == null) {
      return [ChatMessage(messageContent: "", messageSender: "user")];
    }

    return chatSession.messages;
  }

  Future<List<ChatMessage>?> getChatMessagesByDate(DateTime date) async {
    ChatSession? chatSession = await findChatSession(date);

    if (chatSession == null) {
      return null;
    }

    return chatSession.messages;
  }

  Future<void> insertChatMessage(ChatMessage message) async {
    // TODO handle success and error
    try {
      // get current chat session
      ChatSession? chatSession =
          await getChatSession(DateUtil.getCurrentDate());

      if (chatSession == null) throw Exception("Failed to get chat session.");

      final ref = _db.collection("chatSessions").doc(chatSession.id);

      ref.update({
        "messages": FieldValue.arrayUnion([message.toJson()])
      }).then((value) {
        print("Successfully insert chat message!");
      }).catchError((err) {
        print(err);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteChatSession(ChatSession chatSession) async {
    final ref = _db.collection("chatSessions").doc(chatSession.id);

    ref.delete().then((value) {
      print("Successfully delete chat session!");
    }, onError: (error) {
      print("Failed to delete chat session: $error");
    });
  }
}
