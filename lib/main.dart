import 'package:calico/views/goto_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/authentication_controller.dart';

// ThemeData _darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.amber,
//     colorScheme: ColorScheme.dark(),
//     buttonTheme: ButtonThemeData(
//       buttonColor: Colors.amber,
//       disabledColor: Colors.grey,
//     ));

// ThemeData _lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.blue,
//     colorScheme: ColorScheme.dark(),
//     buttonTheme: ButtonThemeData(
//       buttonColor: Colors.blue,
//       disabledColor: Colors.grey,
//     ));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // RxBool _isLightTheme = false.obs;

  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // _saveThemeStatus() async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setBool('theme', _isLightTheme.value);
  // }

  // _getThemeStatus() async {
  //   var _isLight = _prefs.then((SharedPreferences prefs) {
  //     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  //   }).obs;
  //   _isLightTheme.value = (await _isLight.value)!;
  //   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  // }

  // MainApp() {
  //   _getThemeStatus();
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: _lightTheme,
      // darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: GotoScreen(),
      ),
    );
  }
}
