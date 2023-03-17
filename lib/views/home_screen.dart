import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/chat_screen.dart';
import 'package:calico/views/sos_screen.dart';
import 'package:calico/widgets/mood_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/authentication_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TestController testController = Get.put(TestController());
  AuthController authController = Get.find<AuthController>();
  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                color: _colorController.getBackgroundColor(),
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
                      Obx(
                        () {
                          if (authController.user != null) {
                            if (authController.user!.isAnonymous) {
                              return Text(
                                'Halo, Tamu',
                                style: GoogleFonts.rubik(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor,
                                ),
                              );
                            }
                            var splitted =
                                authController.user?.displayName?.split(' ');
                            return Text(
                              'Halo, ${splitted!.first}',
                              style: GoogleFonts.rubik(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            );
                          }
                          return Text(
                            'Halo, Tamu',
                            style: GoogleFonts.rubik(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const SosScreen());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xffEDCFCF),
                            borderRadius: BorderRadius.circular(50),
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
                  MoodBoard(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChatScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff433230).withOpacity(0.15),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff433230).withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 12,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/chat_button.png',
                          width: 342,
                          height: 97,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/expert_button.png',
                      width: 342,
                      height: 97,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // TODO: Delete comment
                  // ElevatedButton.icon(
                  //     onPressed: () {
                  //       testController.detectIntent();
                  //     },
                  //     icon: Icon(Icons.favorite),
                  //     label: Text("Test dialog flow"))
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
