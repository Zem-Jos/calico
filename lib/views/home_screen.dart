import 'package:calico/controllers/authentication_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brownColor,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                color: Color(0xE6FDFCFC),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  const SizedBox(
                    height: 58,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Halo, SadGirl21!',
                        style: GoogleFonts.rubik(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: whiteColor,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xffEDCFCF),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: const Color(0xffB94545),
                              width: 2.5,
                            ),
                          ),
                          child: Text(
                            'SOS',
                            style: GoogleFonts.rubik(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffB94545),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 18),
                    width: 342,
                    height: 173,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: whiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bagaimana Suasana Hatimu Hari Ini?',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/senang.png',
                                  width: 34,
                                ),
                                Text(
                                  'Senang',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/biasa.png',
                                  width: 34,
                                ),
                                Text(
                                  'Biasa',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/sedih.png',
                                  width: 34,
                                ),
                                Text(
                                  'Sedih',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/marah.png',
                                  width: 34,
                                ),
                                Text(
                                  'Marah',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/cemas.png',
                                  width: 34,
                                ),
                                Text(
                                  'Cemas',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/lelah.png',
                                  width: 34,
                                ),
                                Text(
                                  'Lelah',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/kecewa.png',
                                  width: 34,
                                ),
                                Text(
                                  'Kecewa',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/takut.png',
                                  width: 34,
                                ),
                                Text(
                                  'Takut',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/hampa.png',
                                  width: 34,
                                ),
                                Text(
                                  'Hampa',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/mood/semangat.png',
                                  width: 34,
                                ),
                                Text(
                                  'Smgt',
                                  style: GoogleFonts.rubik(
                                      fontSize: 11, color: blackColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ChatScreen());
                    },
                    child: Image.asset(
                      'assets/images/chat_button.png',
                      width: 342,
                      height: 97,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.logout();
                    },
                    child: Image.asset(
                      'assets/images/expert_button.png',
                      width: 342,
                      height: 97,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
