import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/controllers/user_controller.dart';
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
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: GotoScreen(),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(UserController());
      }),
    );
  }
}
