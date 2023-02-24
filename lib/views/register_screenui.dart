import 'package:calico/controllers/authentication_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterUi extends StatefulWidget {
  const RegisterUi({super.key});

  @override
  State<RegisterUi> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo_text.png',
                    height: 53,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x1AE0A071),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xffE0A071),
                      ),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email atau Nomor Telepon',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x1AE0A071),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xffE0A071),
                      ),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: _toggle,
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Kata Sandi',
                      ),
                      validator: (val) =>
                          val!.length < 6 ? 'Password too short.' : null,
                      onSaved: (val) => _password = val!,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.register(
                          emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
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
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
