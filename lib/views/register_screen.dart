import 'package:calico/controllers/authentication_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _password;
  late String _passwordConfirm;
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  // Toggles the password show status
  void _togglePassword() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _togglePasswordConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  @override
  initState() {
    super.initState();
    _password = '';
    _passwordConfirm = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Image.asset('assets/images/auth_bg.png'),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Calico Title
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 47.0),
                        child: Image.asset(
                          'assets/images/logo_text.png',
                          height: 53,
                        ),
                      ),
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xffE0A071),
                          ),
                        ),
                        // Email or Phone Number
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            cursorColor: Color(0xffE0A071),
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email atau Nomor Telepon',
                              hintText: 'Email atau Nomor Telepon',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Email atau nomor telepon tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Name input
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xffE0A071),
                          ),
                        ),
                        // Email or Phone Number
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            cursorColor: Color(0xffE0A071),
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Nama',
                              hintText: 'Nama',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Password
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xffE0A071),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 4.0),
                          child: TextFormField(
                            cursorColor: Color(0xffE0A071),
                            controller: passwordController,
                            obscureText: _obscureTextPassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: _togglePassword,
                                child: Icon(
                                  _obscureTextPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffE0A071),
                                ),
                              ),
                              labelText: 'Kata Sandi',
                              hintText: 'Kata Sandi',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Kata sandi tidak boleh kosong';
                              }
                              if (val!.length < 6) {
                                return 'Kata sandi terlalu pendek.';
                              }
                              return null;
                            },
                            onChanged: (val) => _password = val,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Confirm Password
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0x1AE0A071),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xffE0A071),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 4.0),
                          child: TextFormField(
                            cursorColor: Color(0xffE0A071),
                            controller: passwordConfirmController,
                            obscureText: _obscureTextConfirmPassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: _togglePasswordConfirm,
                                child: Icon(
                                  _obscureTextConfirmPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffE0A071),
                                ),
                              ),
                              labelText: 'Konfirmasi Kata Sandi',
                              hintText: 'Konfirmasi Kata Sandi',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Konfirmasi kata sandi tidak boleh kosong';
                              }
                              if (val != _password) {
                                return 'Konfirmasi kata sandi tidak sesuai';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _passwordConfirm = val!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Register Button
                      GestureDetector(
                        onTap: () {
                          // TODO: check if allowed to register
                          print(_formKey.currentState!.validate());
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            AuthController.instance.register(
                              emailController.text.trim(),
                              nameController.text.trimRight(),
                              passwordController.text.trim(),
                            );
                          }
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
                              'Register',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor),
                            ),
                          ),
                        ),
                      ),
                      // Policy
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                'Dengan mendaftar pada aplikasi Calico, saya telah menyetujui ',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: darkGrayColor,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Ketentuan Layanan',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(text: ' dan '),
                              TextSpan(
                                  text: 'Kebijakan Privasi',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                      ),

                      // Line break, seperator
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                color: darkGrayColor,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'ATAU',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: darkGrayColor,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                color: darkGrayColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Login with Google
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
                                'Daftar dengan Google',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: darkGrayColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Redirect to login page
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun? ',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: darkGrayColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => LoginScreen());
                              },
                              child: Text(
                                'Masuk',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: brownColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
