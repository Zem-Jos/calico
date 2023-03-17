import 'package:calico/controllers/authentication_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/views/login_screen.dart';
import 'package:calico/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:calico/theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  final ThemeController _themeController = Get.find<ThemeController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Image.asset('assets/images/auth_bg.png'),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo_text.png',
                        height: 53,
                      ),
                      SizedBox(
                        height: 49,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: lightBrownColor,
                          ),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: lightBrownColor,
                          decoration: InputDecoration(
                              hintText: 'Email atau Nomor Telepon',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 15, //<-- SEE HERE
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: lightBrownColor,
                          ),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          cursorColor: lightBrownColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Kata Sandi',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            // suffixIcon: InkWell(
                            //   onTap: _toggle,
                            //   child: Icon(_obscureText
                            //       ? Icons.visibility
                            //       : Icons.visibility_off),
                            // ),
                          ),
                          // validator: (val) =>
                          //     val!.length < 6 ? 'Password too short.' : null,
                          // // onSaved: (val) => _password = val!,
                        ),
                      ),
                      SizedBox(
                        height: 15, //<-- SEE HERE
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthController.instance.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                              color: brownColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              'Login',
                              style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                      ),

                      Row(children: [
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Divider(
                                color: Colors.black,
                                height: 50,
                              )),
                        ),
                        Text("ATAU"),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 50,
                              )),
                        ),
                      ]),
                      // SizedBox(
                      //   height: 18,
                      // ),
                      GestureDetector(
                        onTap: () {
                          AuthController.instance.loginWithGoogle();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                            color: whiteColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  width: 19),
                              SizedBox(width: 6),
                              Text(
                                'Masuk dengan Google',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthController.instance.loginAnonymous();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                            color: whiteColor,
                          ),
                          child: Center(
                            child: Text(
                              'Akses Sebagai Tamu',
                              style: GoogleFonts.rubik(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: blackColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pengguna Baru? ',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: blackColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => RegisterScreen());
                            },
                            child: Text(
                              'Daftar',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: brownColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
