import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/chat_session_controller.dart';
import '../models/chat_session_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());

  late List<ChatMessage> _messages = [];
  var messageController = TextEditingController();

  @override
  initState() {
    super.initState();
    _loadMessages();
  }

  _loadMessages() async {
    List<ChatMessage> messages =
        await ChatSessionController.instance.getChatMessages();
    setState(() {
      _messages = messages;
      print(messages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(NavigationPage());
        return false;
      },
      child: Scaffold(
        backgroundColor: _colorController.getBackgroundColor(),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: SafeArea(
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff433230).withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ],
                color: _colorController.getContainerColor(),
              ),
              padding: EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.offAll(NavigationPage());
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: _colorController.getTextColor(),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Image.asset(
                        'assets/images/calico_icon.png',
                        width: 45,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Calico',
                        style: GoogleFonts.rubik(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/icon/sound_on.png',
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 98.0),
                child: Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment: (_messages[index].messageSender == 'calico'
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    (_messages[index].messageSender == 'calico'
                                        ? const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))
                                        : const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                color:
                                    (_messages[index].messageSender == 'calico'
                                        ? _colorController.getCalicoChatColor()
                                        : _colorController.getUserChatColor()),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: Text(
                                _messages[index].messageContent,
                                style: GoogleFonts.rubik(
                                  fontSize: 17,
                                  color: (_messages[index].messageSender ==
                                          'calico'
                                      ? _colorController
                                          .getCalicoChatTextColor()
                                      : _colorController
                                          .getUserChatTextColor()),
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                height: 98,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: _colorController.getContainerColor()),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: _themeController.isDarkMode.value
                              ? darkBackground
                              : lightGrayColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextFormField(
                          style: GoogleFonts.rubik(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: _colorController.getTextColor(),
                          ),
                          controller: messageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: null,
                            hintText: 'Ketik pesan anda',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                          ),
                          maxLines: null,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (messageController.text.isNotEmpty) {
                            ChatMessage chatMessage = ChatMessage(
                                messageContent: messageController.text,
                                messageSender: "user");

                            setState(() {
                              _messages.insert(
                                  _messages.length,
                                  ChatMessage(
                                      messageContent: messageController.text,
                                      messageSender: 'user'));
                              messageController.clear();
                            });
                            // update firebase db
                            ChatSessionController.instance
                                .insertChatMessage(chatMessage);
                          }
                        },
                        child: Image.asset(
                          'assets/images/icon/send_icon.png',
                          width: 45,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent:
          "Halo Izora! Perkenalkan aku Urai, chatbot yang siap menemanimu dalam mengatasi kecemasan",
      messageSender: "calico"),
  ChatMessage(
      messageContent:
          "Ceritakan keluh kesahmu! Aku akan meringkas percakapan harian kita menjadi jurnal. Bisa diakses di halaman riwayat",
      messageSender: "calico"),
  ChatMessage(messageContent: "Salam kenal!", messageSender: "calico"),
  ChatMessage(messageContent: "Halo juga, Urai!", messageSender: "user"),
  ChatMessage(
      messageContent: "Jadi, bagaimana perasaanmu hari ini, Izora?",
      messageSender: "calico"),
  ChatMessage(messageContent: "Sedih", messageSender: "user"),
  ChatMessage(
      messageContent:
          "Halo Izora! Perkenalkan aku Urai, chatbot yang siap menemanimu dalam mengatasi kecemasan",
      messageSender: "calico"),
  ChatMessage(
      messageContent:
          "Ceritakan keluh kesahmu! Aku akan meringkas percakapan harian kita menjadi jurnal. Bisa diakses di halaman riwayat",
      messageSender: "calico"),
  ChatMessage(messageContent: "Salam kenal!", messageSender: "calico"),
  ChatMessage(messageContent: "Halo juga, Urai!", messageSender: "user"),
  ChatMessage(
      messageContent: "Jadi, bagaimana perasaanmu hari ini, Izora?",
      messageSender: "calico"),
  ChatMessage(messageContent: "Sedih", messageSender: "user"),
];
