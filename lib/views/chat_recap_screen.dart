import 'package:calico/controllers/chat_session_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/models/chat_session_model.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRecapScreen extends StatefulWidget {
  const ChatRecapScreen({super.key});

  @override
  State<ChatRecapScreen> createState() => _ChatRecapScreenState();
}

class _ChatRecapScreenState extends State<ChatRecapScreen> {
  late List<ChatMessage> _messages = [];

  var messageController = TextEditingController();

  RxBool soundOn = true.obs;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    final ThemeController _themeController = Get.find<ThemeController>();

    return WillPopScope(
      onWillPop: () async {
        Get.back();
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
                color: Colors.transparent,
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
                          color: brownColor,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Riwayat Chat',
                        style: GoogleFonts.rubik(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(bottom: 98.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edge),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      width: double.infinity,
                      color: whiteColor,
                      child: Text(
                        '17 Agustus 2023',
                        style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: grayColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                              color: (_messages[index].messageSender == 'calico'
                                  ? _colorController.getCalicoChatColor()
                                  : _colorController.getUserChatColor()),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: SelectableText(
                              _messages[index].messageContent,
                              style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: (_messages[index].messageSender ==
                                        'calico'
                                    ? _colorController.getCalicoChatTextColor()
                                    : _colorController.getUserChatTextColor()),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
    ;
  }
}
