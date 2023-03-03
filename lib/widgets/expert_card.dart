import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertCard extends StatelessWidget {
  const ExpertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Image.asset(
              'assets/images/icon/activities.png',
              width: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A.D. Andayanti, S.Psi., Psi',
                      style: GoogleFonts.rubik(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'Psikolog Klinis',
                      style: GoogleFonts.rubik(
                          fontSize: 11,
                          color: Color(0xff9F9F9F),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RS Makmur Keluarga ',
                      style: GoogleFonts.rubik(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Sleman, Yogyakarta',
                      style: GoogleFonts.rubik(
                          fontSize: 11,
                          color: Color(0xff9F9F9F),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
