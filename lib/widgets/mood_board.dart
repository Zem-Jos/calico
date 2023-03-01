import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodBoard extends StatelessWidget {
  const MoodBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      width: 342,
      height: 173,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bagaimana Suasana Hatimu Hari Ini?',
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Column(
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}
