import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/expert_detail_screen.dart';
import 'package:calico/widgets/expert_online_offline.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertCard extends StatelessWidget {
  const ExpertCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return GestureDetector(
      onTap: () {
        Get.to(ExpertDetailScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _colorController.getContainerColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Image.asset(
              'assets/images/icon/activities.png',
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A.D. Andayanti, S.Psi., Psi',
                  style: GoogleFonts.rubik(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                // SizedBox(
                //   height: 14,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ExpertOnlineOffline(
                    fontSize: 10,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Psikolog Klinis',
                          style: GoogleFonts.rubik(
                              fontSize: 10,
                              color: brownColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'RS Makmur Keluarga ',
                          style: GoogleFonts.rubik(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: brownColor),
                        ),
                        Text(
                          'Sleman, Yogyakarta',
                          style: GoogleFonts.rubik(
                              fontSize: 10,
                              color: grayColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        color: _colorController.getBackgroundColor(),
                        child: Text(
                          '120.000',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: _colorController.getTextColor(),
                          ),
                        ),
                      ),
                    )
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
