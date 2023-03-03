import 'package:calico/views/register_screen.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/goto_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    if (user == null) {
      await Get.offAll(() => GotoScreen());
      // await Get.offAll(() => RegisterUi());
    } else {
      Get.offAll(() => NavigationPage());
    }
  }

  void register(String email, String name, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar('About User', 'User message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Account creation failed',
              style: GoogleFonts.roboto(color: Colors.white)),
          messageText: Text(e.toString(),
              style: GoogleFonts.roboto(color: Colors.white)));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Login failed',
              style: GoogleFonts.roboto(color: Colors.white)),
          messageText: Text(e.toString(),
              style: GoogleFonts.roboto(color: Colors.white)));
    }
  }

  void loginWithGoogle() async {
    try {
      await auth.signInWithPopup(GoogleAuthProvider());
    } catch (e) {
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Login failed',
              style: GoogleFonts.roboto(color: Colors.white)),
          messageText: Text(e.toString(),
              style: GoogleFonts.roboto(color: Colors.white)));
    }
  }

  void loginAnonymous() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      Get.snackbar('About Login', 'Login message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Login failed',
              style: GoogleFonts.roboto(color: Colors.white)),
          messageText: Text(e.toString(),
              style: GoogleFonts.roboto(color: Colors.white)));
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
