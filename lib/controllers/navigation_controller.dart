import 'package:calico/views/chat_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomNavigationController extends GetxController {
  var selectedIndex = 1.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
