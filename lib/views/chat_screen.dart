// TODO : Add chat screen
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF2ED),
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
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
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.offAll(() => NavigationPage());
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        Image.asset('assets/images/calico_icon.png'),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Calico',
                          style: GoogleFonts.rubik(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Image.asset('assets/images/sound_on.png'),
                  ]),
            ),
          ),
          Spacer(),
          Container(
            height: 98,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Color(0xffFDFCFC),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 294,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0x1AE0A071),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Color(0xffE0A071),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17.0),
                        child: TextFormField(
                          controller: messageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Ketik pesan anda',
                            hintText: 'Ketik pesan anda',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/send_icon.png',
                      width: 45,
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
