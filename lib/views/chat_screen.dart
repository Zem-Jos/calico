// TODO : Add chat screen
import 'package:calico/models/chat_message_model.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(NavigationPage());
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffFAF2ED),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
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
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                color: Color(0xffFDFCFC),
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
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
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
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == 'receiver'
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.75,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                (messages[index].messageType == 'receiver'
                                    ? const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))
                                    : const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                            color: (messages[index].messageType == 'receiver'
                                ? const Color(0xffFDFCFC)
                                : const Color(0xffE0A071)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Text(
                            messages[index].messageContent,
                            style: GoogleFonts.rubik(
                              fontSize: 17,
                              color: (messages[index].messageType == 'receiver'
                                  ? const Color(0xff242424)
                                  : const Color(0xffFDFCFC)),
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                height: 98,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: Color(0xffFDFCFC)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 294,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            style: GoogleFonts.rubik(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                            controller: messageController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Ketik pesan anda',
                              hintText: 'Ketik pesan anda',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon/send_icon.png',
                        width: 45,
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
      messageType: "receiver"),
  ChatMessage(
      messageContent:
          "Ceritakan keluh kesahmu! Aku akan meringkas percakapan harian kita menjadi jurnal. Bisa diakses di halaman riwayat",
      messageType: "receiver"),
  ChatMessage(messageContent: "Salam kenal!", messageType: "receiver"),
  ChatMessage(messageContent: "Halo juga, Urai!", messageType: "sender"),
  ChatMessage(
      messageContent: "Jadi, bagaimana perasaanmu hari ini, Izora?",
      messageType: "receiver"),
  ChatMessage(messageContent: "Sedih", messageType: "sender"),
  ChatMessage(
      messageContent:
          "Halo Izora! Perkenalkan aku Urai, chatbot yang siap menemanimu dalam mengatasi kecemasan",
      messageType: "receiver"),
  ChatMessage(
      messageContent:
          "Ceritakan keluh kesahmu! Aku akan meringkas percakapan harian kita menjadi jurnal. Bisa diakses di halaman riwayat",
      messageType: "receiver"),
  ChatMessage(messageContent: "Salam kenal!", messageType: "receiver"),
  ChatMessage(messageContent: "Halo juga, Urai!", messageType: "sender"),
  ChatMessage(
      messageContent: "Jadi, bagaimana perasaanmu hari ini, Izora?",
      messageType: "receiver"),
  ChatMessage(messageContent: "Sedih", messageType: "sender"),
];
