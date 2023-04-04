import 'package:calico/controllers/authentication_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/term_condition.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/androidmanagement/v1.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AuthController authController = Get.find<AuthController>();
  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(NavigationPage());
        return true;
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
              color: Colors.transparent,
              padding: const EdgeInsets.only(right: 16),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _colorController.getContainerColor(),
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
                          authController.user?.displayName ?? 'Tamu',
                          style: GoogleFonts.rubik(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 4),
                        Text(
                          authController.user?.email ?? 'anonim',
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
                    color: _colorController.getContainerColor(),
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
                    color: _colorController.getContainerColor(),
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
                      Obx(() => Switch(
                            activeColor: brownColor,
                            activeTrackColor: lightBrownColor,
                            inactiveThumbColor: brownColor,
                            inactiveTrackColor: lightGrayColor,
                            value: _themeController.isDarkMode.value,
                            onChanged: (value) {
                              setState(() {
                                _themeController.changeTheme();
                              });
                            },
                          )),
                    ]),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => Get.to(TermCondition()),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
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
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    AuthController.instance.logout();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
