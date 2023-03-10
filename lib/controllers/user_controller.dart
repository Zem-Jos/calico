import 'package:calico/controllers/authentication_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../views/login_screen.dart';

class UserController extends GetxController {
  static UserController instance = Get.put(UserController());
  // UserModel? user;
  Rx<UserModel> user = const UserModel(
    email: '',
    name: '',
  ).obs;
  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db
        .collection('users')
        .doc(user.id)
        .set(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created.",
            snackPosition: SnackPosition.BOTTOM))
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error.toString());
    });
  }

  Future<UserModel?> getUser(String id) async {
    try {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: id)
          .get();

      if (result.docs.isEmpty) {
        Get.offAll(() => LoginScreen());
        throw Exception('User not found');
      }

      UserModel user = UserModel.fromFirestore(result.docs.first);

      return user;
    } catch (e) {
      return null;
    }
  }

  Future<void> setUser(UserModel user) async {
    this.user.value = user;
    update();
  }
}
