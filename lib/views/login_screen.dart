import 'package:calico/controllers/authentication_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/views/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:calico/theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  final ThemeController _themeController = Get.find<ThemeController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  void togglePassword() {
    obscureText.value = !obscureText.value;
  }

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo_text.png',
                          height: 53,
                        ),
                        const SizedBox(
                          height: 49,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0x1AE0A071),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: lightBrownColor,
                            ),
                          ),
                          child: TextFormField(
                              controller: emailController,
                              cursorColor: lightBrownColor,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                border: InputBorder.none,
                              ),
                              validator: (val) => val!.isEmpty
                                  ? 'Email tidak boleh kosong.'
                                  : null),
                        ),
                        const SizedBox(
                          height: 15, //<-- SEE HERE
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0x1AE0A071),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: lightBrownColor,
                            ),
                          ),
                          child: Obx(
                            () => TextFormField(
                              controller: passwordController,
                              cursorColor: lightBrownColor,
                              obscureText: obscureText.value,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Kata Sandi',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                suffixIcon: InkWell(
                                  onTap: togglePassword,
                                  child: Icon(
                                    obscureText.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xffE0A071),
                                  ),
                                ),
                              ),
                              validator: (val) => val!.isEmpty
                                  ? 'Password tidak boleh kosong.'
                                  : null,
                              // onSaved: (val) => _password = val!,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15, //<-- SEE HERE
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              AuthController.instance.login(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 44,
                            decoration: const BoxDecoration(
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
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 15.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                          const Text("ATAU"),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10.0),
                                child: const Divider(
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
                            decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/google.png',
                                    width: 19),
                                const SizedBox(width: 6),
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
                        const SizedBox(
                          height: 18,
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthController.instance.loginAnonymous();
                          },
                          child: Container(
                            width: double.infinity,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
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
                        const SizedBox(
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
                                Get.to(() => const RegisterScreen());
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
              ),
            ],
          )),
    );
  }
}
