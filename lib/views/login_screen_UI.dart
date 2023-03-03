import 'package:flutter/material.dart';
import 'package:calico/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenUI extends StatelessWidget {
  const LoginScreenUI({super.key});

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
                  SizedBox(
                    height: 30, //<-- SEE HERE
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x1AE0A071),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Color(0xffE0A071),
                      ),
                    ),
                    child: TextFormField(
                      // controller: emailController,
                      cursorColor: Color(0xffe0a071),
                      decoration: InputDecoration(
                          hintText: 'Email atau Nomor Telepon',
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                        color: Color(0xffE0A071),
                      ),
                    ),
                    child: TextFormField(
                      cursorColor: Color(0xffe0a071),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Kata Sandi',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
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
                      // AuthController.instance.register(
                      //     emailController.text.trim(),
                      //     passwordController.text.trim());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                    Text("ATAU"),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
