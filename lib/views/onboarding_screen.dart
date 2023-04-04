import 'package:calico/theme.dart';
import 'package:calico/views/login_screen.dart';
import 'package:calico/views/onboarding/onboarding_1.dart';
import 'package:calico/views/onboarding/onboarding_2.dart';
import 'package:calico/views/onboarding/onboarding_3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = index == 2;
            });
          },
          children: const [
            Onboarding1Screen(),
            Onboarding2Screen(),
            Onboarding3Screen()
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Spacer(),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: grayColor,
                  activeDotColor: brownColor,
                  expansionFactor: 4,
                  spacing: 5,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                  onLastPage ? Get.to(() => LoginScreen()) : null;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 100.0),
                        child: Center(
                          child: Text(
                            onLastPage ? 'Mulai' : 'Lanjut',
                            style: GoogleFonts.rubik(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: whiteColor),
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              onLastPage
                  ? SizedBox(
                      height: 18,
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        'Lewati',
                        style: GoogleFonts.rubik(
                            color: brownColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
