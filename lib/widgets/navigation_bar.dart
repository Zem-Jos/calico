import 'package:calico/controllers/navigation_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/views/activity_screen.dart';
import 'package:calico/views/calendar_screen.dart';
import 'package:calico/views/expert_screen.dart';
import 'package:calico/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());
  NavigationPage({Key? key}) : super(key: key);

  final screen = [
    const HomeScreen(),
    const ActivityScreen(),
    ExpertScreen(),
    CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();
    final ColorController _colorController = Get.put(ColorController());
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Color(0x26000000), spreadRadius: 0, blurRadius: 15),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Obx(
            () => SizedBox(
              height: 94,
              child: BottomNavigationBar(
                elevation: 0.0,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/icon/home.png',
                      width: 32,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/icon/home_active.png',
                      width: 32,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon/activities.png',
                        width: 32),
                    activeIcon: Image.asset(
                        'assets/images/icon/activities_active.png',
                        width: 32),
                    label: 'Activity',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon/chat.png', width: 32),
                    activeIcon: Image.asset(
                        'assets/images/icon/chat_active.png',
                        width: 32),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset('assets/images/icon/calendar.png',
                        width: 32),
                    activeIcon: Image.asset(
                        'assets/images/icon/calendar_active.png',
                        width: 32),
                    label: 'Calendar',
                  ),
                ],
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: bottomNavigationController.selectedIndex.value,
                selectedItemColor: const Color(0xff157FFB),
                onTap: (index) => bottomNavigationController.changeIndex(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
