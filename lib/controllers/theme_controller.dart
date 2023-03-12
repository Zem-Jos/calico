import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
}

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

  Color getActivityBackgroundColor() {
    if (Get.isDarkMode) {
      return blackColor;
    } else {
      return whiteColor;
    }
  }
}
