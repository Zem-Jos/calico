import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/chat_session_model.dart';
import '../utils/getCurrentDate.dart';

class ChatSessionController extends GetxController {
  static ChatSessionController instance = Get.put(ChatSessionController());
  final _db = FirebaseFirestore.instance;

  Future<ChatSession?> getChatSession(DateTime session) async {
    final ref = _db
        .collection("chatSessions")
        .where("session", isEqualTo: session.toString());

    ref.get().then((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        print("No chat session found!");
        createNewChatSession();
        // return empty ChatSession
        return ChatSession(messages: [], session: getCurrentDate());
      }
      ChatSession chatSession =
          ChatSession.fromFirestore(snapshot: querySnapshot.docs.first);

      return chatSession;
    }, onError: (error) {
      print("Failed to get chat session: $error");
    });
    return null;
  }

  Future<void> createNewChatSession() async {
    ChatSession chatSession = ChatSession(
      messages: [],
      session: getCurrentDate(),
    );

    print('chatsession: ${chatSession.toJson()}');

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
    ChatSession? chatSession = await getChatSession(getCurrentDate());

    if (chatSession == null) {
      return [];
    }

    return chatSession.messages;
  }

  Future<void> insertChatMessage(
      ChatSession chatSession, ChatMessage message) async {
    final ref = _db.collection("chatSessions").doc(chatSession.id);

    ref.update({
      "messages": FieldValue.arrayUnion([message.toJson()])
    }).then((value) {
      print("Successfully insert chat message!");
    }, onError: (error) {
      print("Failed to insert chat message: $error");
    });
  }

  Future<void> updateChatSession(ChatSession chatSession) async {
    final ref = _db.collection("chatSessions").doc(chatSession.id);

    ref.update({
      "messages": chatSession.messages.map((e) => e.toJson()).toList(),
      "session": chatSession.session.toString(),
    }).then((value) {
      print("Successfully update chat session!");
    }, onError: (error) {
      print("Failed to update chat session: $error");
    });
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
