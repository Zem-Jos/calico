import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController instance = UserController();
  UserModel? user;
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
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: id)
        .get();

    if (result.docs.isEmpty) {
      return null;
    }

    UserModel user = UserModel.fromFirestore(result.docs.first);

    return user;
  }

  Future<void> setUser(UserModel user) async {
    this.user = user;
    update();
  }
}
