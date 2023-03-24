import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/websecurityscanner/v1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Calico',
                style: GoogleFonts.fredoka(
                  color: brownColor,
                  fontSize: 76,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/images/splash_1.png',
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
