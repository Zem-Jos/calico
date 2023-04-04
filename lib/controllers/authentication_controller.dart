import 'package:calico/views/onboarding_screen.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    if (user == null) {
      // await Get.offAll(() => GotoScreen());
      await Get.offAll(() => OnboardingScreen());
    } else {
      Get.offAll(() => NavigationPage());
    }
  }

  void register(String email, String name, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user == null) {
        throw Exception('User is null');
      }

      User user = userCredential.user!;
      await user.updateDisplayName(name);
      user.reload();
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

  void login(String email, String password) async {
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

  Future<UserCredential?> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      // Obtain the Google auth details (id token and access token).
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential using the Google auth details.
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential.
      return await auth.signInWithCredential(credential);
    }

    return null;
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
