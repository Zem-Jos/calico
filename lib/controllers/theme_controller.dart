import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}

// class ThemeController extends GetxController {
//   final String _prefKey = 'themeMode';
//   final ThemeMode _defaultThemeMode = ThemeMode.system;

//   late ThemeMode _themeMode;

//   @override
//   void onInit() async {
//     super.onInit();
//     await _loadThemeMode();
//   }

//   Future<void> _loadThemeMode() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? themeIndex = prefs.getInt(_prefKey);
//     if (themeIndex == null) {
//       _themeMode = _defaultThemeMode;
//     } else {
//       _themeMode = ThemeMode.values[themeIndex];
//     }
//     update();
//   }

//   void toggleTheme() {
//     _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     _saveThemeMode();
//     update();
//   }

//   Future<void> _saveThemeMode() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_prefKey, _themeMode.index);
//   }

//   ThemeData getThemeData() {
//     switch (_themeMode) {
//       case ThemeMode.light:
//         return ThemeData.light();
//       case ThemeMode.dark:
//         return ThemeData.dark();
//       default:
//         return ThemeData.light();
//     }
//   }
// }

class ColorController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();

  Color getContainerColor() {
    if (_themeController.isDarkMode.value) {
      return blackColor;
    } else {
      return whiteColor;
    }
  }

  Color getBackgroundColor() {
    if (_themeController.isDarkMode.value) {
      return darkBackground;
    } else {
      return lightGrayColor;
    }
  }

  Color getTextColor() {
    if (Get.isDarkMode) {
      return whiteColor;
    } else {
      return blackColor;
    }
  }

  Color getCalicoChatColor() {
    if (Get.isDarkMode) {
      return blackColor;
    } else {
      return whiteColor;
    }
  }

  Color getCalicoChatTextColor() {
    if (Get.isDarkMode) {
      return whiteColor;
    } else {
      return blackColor;
    }
  }

  Color getUserChatColor() {
    if (Get.isDarkMode) {
      return lightGrayColor;
    } else {
      return brownColor;
    }
  }

  Color getUserChatTextColor() {
    if (Get.isDarkMode) {
      return blackColor;
    } else {
      return whiteColor;
    }
  }
}
