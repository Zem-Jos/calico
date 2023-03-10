import 'package:calico/controllers/authentication_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/chat_session_model.dart';
import '../utils/date_util.dart';

class ChatSessionController extends GetxController {
  static ChatSessionController instance = Get.put(ChatSessionController());
  final _db = FirebaseFirestore.instance;

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
    print("chatSession adf: ${chatSession.id}");
    return chatSession;
  }

  Future<ChatSession?> findChatSession(DateTime session) async {
    final ref = _db
        .collection("chatSessions")
        .where("firebaseSession", isEqualTo: Timestamp.fromDate(session))
        .where("userId", isEqualTo: AuthController.instance.user!.uid);

    final querySnapshot = await ref.get();

    if (querySnapshot.docs.isEmpty) {
      print("No chat session found!");
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
        .whenComplete(() {
      print("Successfully create chat session!");
    }).catchError((error, stackTrace) {
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
    try {
      // get current chat session
      ChatSession? chatSession =
          await getChatSession(DateUtil.getCurrentDate());

      if (chatSession == null) throw Exception("Failed to get chat session.");
      print("chatSession id: $chatSession.id");

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
