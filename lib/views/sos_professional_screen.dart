import 'package:calico/theme.dart';
import 'package:calico/views/sos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SosProfessionalScreen extends StatelessWidget {
  const SosProfessionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE2E8),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            height: 65,
            color: Color(0xffFFE2E8),
            padding: EdgeInsets.only(right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offAll(SosScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 45.0, vertical: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Memiliki bantuan yang tepat pada waktu yang tepat dapat membantumu kembali lebih kuat.',
                style: GoogleFonts.rubik(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Jika kamu memerlukan bantuan atau seseorang untuk diajak bicara, berikut adalah daftar hotline',
                style: GoogleFonts.rubik(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.5,
                      color: redColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          'Hotline Pemerintah',
                          style: GoogleFonts.rubik(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hotline 24 jam: ',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => LoginScreen());
                              },
                              child: Text(
                                '119',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: redColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.5,
                      color: redColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          'Kementrian Kesehatan',
                          style: GoogleFonts.rubik(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hotline: ',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => LoginScreen());
                              },
                              child: Text(
                                '500-454',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: redColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _callNumber(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2.5,
                      color: redColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 30),
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          'Save Yourselves Indonesia (Jakarta)',
                          style: GoogleFonts.rubik(
                            color: blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hotline: ',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                '082124326459',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: redColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_callNumber() async {
  const number = '081234264440'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}
