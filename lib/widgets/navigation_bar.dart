import 'package:calico/controllers/navigation_controller.dart';
import 'package:calico/views/activity_screen.dart';
import 'package:calico/views/calendar_screen.dart';
import 'package:calico/views/chat_screen.dart';
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
    ChatScreen(),
    const CalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
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
    );
  }
}
