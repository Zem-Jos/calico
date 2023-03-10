// ignore_for_file: prefer_const_constructors
import 'package:calico/theme.dart';
import 'package:calico/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class GotoScreen extends StatelessWidget {
  const GotoScreen({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffEBF5FB),
                Color(0xff8FC5F6),
              ],
              stops: [
                0.0,
                1.0,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/images/onboarding.png'),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 34),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kenalin, Aku Calico!',
                      style: GoogleFonts.rubik(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Aku adalah kucing menggemaskan yang siap membantumu melewati masa sulit.',
                      style: GoogleFonts.rubik(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: grayColor,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(8)),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13.0, horizontal: 100.0),
                            child: Center(
                              child: Text(
                                'Lanjut',
                                style: GoogleFonts.rubik(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              )),
        ),
      ]),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     top: false,
    //     bottom: false,
    //     child: Stack(
    //       children: [
    //         Column(
    //           children: [
    //             Container(
    //               width: MediaQuery.of(context).size.width,
    //               height: MediaQuery.of(context).size.height * 0.8,
    //               color: Color(0xff157FFB),
    //               child: Column(
    //                 children: [
    //                   SizedBox(
    //                     height: MediaQuery.of(context).size.height * 0.23,
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //         Column(
    //           children: [
    //             SizedBox(
    //               height: MediaQuery.of(context).size.height * 0.60,
    //             ),
    //             Container(
    //               width: MediaQuery.of(context).size.width,
    //               height: MediaQuery.of(context).size.height * 0.4,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.vertical(
    //                   top: Radius.circular(35),
    //                 ),
    //                 color: Colors.white,
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.only(top: 30, left: 35),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'Gotta catch em all!',
    //                       style: GoogleFonts.roboto(
    //                         fontSize: 30,
    //                         fontWeight: FontWeight.w400,
    //                         color: Color(0xff142237),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 12,
    //                     ),
    //                     Text(
    //                       'Welcome to the complete Pokedex app.',
    //                       style: GoogleFonts.roboto(
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w400,
    //                         color: Color(0xff142237),
    //                       ),
    //                     ),
    //                     Spacer(),
    //                     Padding(
    //                       padding: const EdgeInsets.only(
    //                         bottom: 25,
    //                       ),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           Text(
    //                             'GET STARTED',
    //                             style: GoogleFonts.roboto(
    //                                 fontWeight: FontWeight.w600),
    //                           ),
    //                           SizedBox(
    //                             width: 20,
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.only(right: 25),
    //                             child: IconButton(
    //                               iconSize: 50,
    //                               icon: Icon(
    //                                 Icons.arrow_forward_ios,
    //                                 color: Color(0xff157FFB),
    //                               ),
    //                               onPressed: () {
    //                                 Get.to(() => LoginScreen());
    //                               },
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
