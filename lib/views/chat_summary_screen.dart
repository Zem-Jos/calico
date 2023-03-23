import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/chat_recap_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatSummaryScreen extends StatelessWidget {
  const ChatSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    final ThemeController _themeController = Get.put(ThemeController());
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: brownColor),
        title: Text(
          'Rekap Percakapan',
          style: GoogleFonts.rubik(
            color: _colorController.getTextColor(),
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: edge),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(_themeController.isDarkMode.value
                  ? 'assets/images/header_recap_dark.png'
                  : 'assets/images/header_recap.png'),
              Container(
                decoration: BoxDecoration(
                  color: _colorController.getActivityBackgroundColor(),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                width: double.infinity,
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Get.to(ChatRecapScreen()),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    color: brownColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Lihat Detail Riwayat Percakapan',
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: whiteColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
