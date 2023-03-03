// ignore_for_file: prefer_const_constructors
import 'package:calico/views/register_screen.dart';
import 'package:calico/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class GotoScreen extends StatelessWidget {
  const GotoScreen({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Color(0xff157FFB),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gotta catch em all!',
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff142237),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Welcome to the complete Pokedex app.',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff142237),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'GET STARTED',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: IconButton(
                                  iconSize: 50,
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff157FFB),
                                  ),
                                  onPressed: () {
                                    Get.to(() => RegisterScreen());
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
