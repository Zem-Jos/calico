import 'package:calico/controllers/calendar_controller.dart';
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
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Container(
            height: 65,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.transparent,
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
                        Get.find<CalendarController>().clearChatSummary();
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: brownColor,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Rekap Percakapan',
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
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                width: double.infinity,
                child: GetBuilder<CalendarController>(
                  builder: (controller) {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Text(
                      controller.selectedSummary.value,
                      style: GoogleFonts.rubik(
                        color: _colorController.getTextColor(),
                        fontSize: 15,
                        // fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Get.to(() => ChatRecapScreen()),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                        color: whiteColor,
                      ),
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
