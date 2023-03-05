import 'package:calico/theme.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var switchState = false;
    return Scaffold(
      backgroundColor: shadeGrayColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Container(
            height: 65,
            color: Colors.transparent,
            padding: EdgeInsets.only(right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.off(NavigationPage());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: brownColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon/avatar.png',
                        width: 45,
                      ),
                      Text(
                        'SadGirl21',
                        style: GoogleFonts.rubik(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'user51267839120',
                        style: GoogleFonts.rubik(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: grayColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(children: [
                    Image.asset(
                      'assets/images/icon/notif_icon.png',
                      width: 35,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Notifikasi',
                      style: GoogleFonts.rubik(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 16.0),
                  child: Row(children: [
                    Image.asset(
                      'assets/images/icon/dark_icon.png',
                      width: 35,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Mode Gelap',
                      style: GoogleFonts.rubik(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Switch.adaptive(
                      activeColor: brownColor,
                      activeTrackColor: lightBrownColor,
                      inactiveThumbColor: brownColor,
                      inactiveTrackColor: lightGrayColor,
                      splashRadius: 50.0,
                      // boolean variable value
                      // value: forAndroid,
                      value: switchState,
                      // changes the state of the switch
                      // onChanged: (value) => setState(() => forAndroid = value),
                      onChanged: (value) => setState(() => switchState = value),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(children: [
                    Image.asset(
                      'assets/images/icon/term_icon.png',
                      width: 35,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Ketentuan Penggunaan',
                      style: GoogleFonts.rubik(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(children: [
                    Image.asset(
                      'assets/images/icon/out_icon.png',
                      width: 35,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Keluar',
                      style: GoogleFonts.rubik(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
