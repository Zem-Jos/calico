import 'package:calico/controllers/notification_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/firebase_options.dart';
import 'package:calico/views/goto_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:timezone/browser.dart';
import 'controllers/authentication_controller.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/browser.dart' as tz;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('playstore');
  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );

  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //     AndroidNotificationDetails(
  //   'default_channel', // channel id
  //   'Default Channel', // channel namehannel description
  //   importance: Importance.high,
  //   priority: Priority.high,
  //   playSound: true,
  // );

  // const NotificationDetails platformChannelSpecifics =
  //     NotificationDetails(android: androidPlatformChannelSpecifics);

  // await flutterLocalNotificationsPlugin.show(
  //   0, // notification id
  //   'Title', // notification title
  //   'Body', // notification body
  //   platformChannelSpecifics,
  // );

  // await flutterLocalNotificationsPlugin.zonedSchedule(
  //   0, // notification id
  //   'Title', // notification title
  //   'Body', // notification body
  //   // scheduled date and time
  //   TZDateTime.now(tz.local)
  //       .add(const Duration(seconds: 5)), // scheduled date and time
  //   platformChannelSpecifics,
  //   androidAllowWhileIdle: true,
  //   uiLocalNotificationDateInterpretation:
  //       UILocalNotificationDateInterpretation.absoluteTime,
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
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
    );
  }
}
