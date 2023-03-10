import 'package:calico/views/login_screen.dart';
import 'package:calico/controllers/user_controller.dart';
import 'package:calico/models/user_model.dart';
import 'package:calico/views/register_screen.dart';
import 'package:calico/widgets/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../views/goto_screen.dart';

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
      await Get.offAll(() => GotoScreen());
    } else {
      Get.offAll(() => NavigationPage());
    }
  }

  void register(String email, String name, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel user = UserModel(
        id: auth.currentUser!.uid,
        email: email,
        name: name,
      );

      await UserController().createUser(user);
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

      // check if user exists in firestore
      UserModel? user = await UserController().getUser(googleUser.id);

      if (user == null) {
        // create user in firestore
        user = UserModel(
          id: googleUser.id,
          email: googleUser.email,
          name: googleUser.displayName ?? "",
        );

        await UserController().createUser(user);
      }

      UserController.instance.setUser(user);

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
