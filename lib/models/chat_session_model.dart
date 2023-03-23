import 'package:calico/utils/date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatSession {
  final String? id;
  List<ChatMessage> messages;
  DateTime session;
  Timestamp firebaseSession;
  String userId;

  ChatSession({
    this.id,
    required this.messages,
    required DateTime session,
    required this.userId,
  })  : session = DateUtil.getCurrentDate(),
        firebaseSession = Timestamp.fromDate(session);

  factory ChatSession.fromFirestore({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    // var list = json['messages'] as List;
    final data = snapshot.data();
    if (data == null) throw Exception("Chat Session not found!");
    var id = snapshot.id;
    var list = data['messages'] as List;
    var session = data['session'];
    var userId = data['userId'];
    DateTime sessionDate = DateTime.parse(session);

    List<ChatMessage> messages =
        list.map((message) => ChatMessage.fromJson(message)).toList();
    return ChatSession(
      id: id,
      messages: messages,
      session: sessionDate,
      userId: userId,
    );
  }

  // tojson
  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((e) => e.toJson()).toList(),
      'session': session.toString(),
      'userId': userId,
      'firebaseSession': firebaseSession,
    };
  }

  @override
  String toString() {
    return "ChatSession(id: $id, messages: $messages, session: $session, userId: $userId)";
  }
}

class ChatMessage {
  String messageContent;
  String messageSender;
  DateTime timeSent;
  ChatMessage({
    required this.messageContent,
    required this.messageSender,
    DateTime? timeSent,
  }) : timeSent = timeSent ?? DateTime.now();

  // fromjson
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      messageContent: json['messageContent'],
      messageSender: json['messageSender'],
      timeSent: DateTime.parse(json['timeSent']),
    );
  }

  // tojson
  Map<String, dynamic> toJson() {
    return {
      'messageContent': messageContent,
      'messageSender': messageSender,
      'timeSent': timeSent.toString(),
    };
  }
}
