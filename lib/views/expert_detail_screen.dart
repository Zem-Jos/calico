import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/expert_online_offline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../models/expert_model.dart';

class ExpertDetailScreen extends StatelessWidget {
  final ExpertInfo expertInfo;
  const ExpertDetailScreen({
    super.key,
    required this.expertInfo,
  });

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());
    return Scaffold(
      backgroundColor: colorController.getActivityBackgroundColor(),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Image.network(
                  expertInfo.image,
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expertInfo.name,
                        style: GoogleFonts.rubik(
                            fontSize: 24,
                            color: colorController.getTextColor(),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   'X Tahun Pengalaman',
                      //   style: GoogleFonts.rubik(
                      //       fontSize: 17,
                      //       color: brownColor,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        expertInfo.title,
                        style: GoogleFonts.rubik(
                            fontSize: 17,
                            color: brownColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ExpertOnlineOffline(fontSize: 15),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: lightBrownColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: whiteColor,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  expertInfo.hospital,
                                  style: GoogleFonts.rubik(
                                      color: whiteColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  expertInfo.location,
                                  style: GoogleFonts.rubik(
                                      color: whiteColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: lightBrownColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.contacts,
                              color: whiteColor,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kontak',
                                  style: GoogleFonts.rubik(
                                      color: whiteColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  expertInfo.phone,
                                  style: GoogleFonts.rubik(
                                      color: whiteColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        expertInfo.description,
                        style: GoogleFonts.rubik(
                            fontSize: 15,
                            color: colorController.getTextColor(),
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: brownColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Hubungi Via Chat',
                          style: GoogleFonts.rubik(
                              color: whiteColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expertInfo.price,
                              style: GoogleFonts.rubik(
                                  color: whiteColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Per Sesi 2 Jam',
                              style: GoogleFonts.rubik(
                                  color: whiteColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
