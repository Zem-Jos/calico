import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jumping_dot/jumping_dot.dart';

import '../controllers/chat_session_controller.dart';
import '../models/chat_session_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatSessionController chatSessionController =
      Get.put(ChatSessionController());

  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(const NavigationPage());
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
                      color: const Color(0xff433230).withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                  color: _colorController.getContainerColor(),
                ),
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.offAll(const NavigationPage());
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
                    Obx(
                      () {
                        return chatSessionController.soundOn.isTrue
                            ? GestureDetector(
                                onTap: chatSessionController.soundOn =
                                    false.obs,
                                child: Image.asset(
                                  'assets/images/icon/sound_on.png',
                                  width: 40,
                                ),
                              )
                            : GestureDetector(
                                onTap: chatSessionController.soundOn = true.obs,
                                child: Image.asset(
                                    'assets/images/icon/sound_off.png',
                                    width: 40),
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          body: GetBuilder<ChatSessionController>(
            builder: (chatSessionController) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: chatSessionController.chatMessages.length + 1,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 10),
                    reverse: true,
                    itemBuilder: (context, index) {
                      List<dynamic> messageList = ["padding"];
                      messageList.insertAll(1,
                          chatSessionController.chatMessages.reversed.toList());
                      if (index == 0) {
                        if (chatSessionController.isLoading.isTrue) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.22,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: _colorController.getCalicoChatColor(),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: const JumpingDots(
                                  color: grayColor,
                                  radius: 10,
                                  numberOfDots: 3,
                                ),
                              ),
                            ),
                          );
                        }
                        // return nothing
                        return const SizedBox.shrink();
                      }
                      return Container(
                        padding: const EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment:
                              (messageList[index].messageSender == 'calico'
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  (messageList[index].messageSender == 'calico'
                                      ? const BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))
                                      : const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                              color:
                                  (messageList[index].messageSender == 'calico'
                                      ? _colorController.getCalicoChatColor()
                                      : _colorController.getUserChatColor()),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: SelectableText(
                              messageList[index].messageContent,
                              style: GoogleFonts.rubik(
                                fontSize: 17,
                                color: (messageList[index].messageSender ==
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    height: 98,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        color: _colorController.getContainerColor()),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // input message
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
                              cursorColor: brownColor,
                              controller: messageController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: null,
                                hintText: 'Ketik pesan anda',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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

                                chatSessionController.sendMessage(chatMessage);
                                messageController.clear();
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
          )),
    );
  }
}
