import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
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
}
