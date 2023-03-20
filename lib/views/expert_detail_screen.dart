import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/expert_online_offline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/keep/v1.dart';

class ExpertDetailScreen extends StatelessWidget {
  const ExpertDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return Scaffold(
      backgroundColor: _colorController.getActivityBackgroundColor(),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Image.asset(
                  'assets/images/article/article-default.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: edge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Psikolog',
                        style: GoogleFonts.rubik(
                            fontSize: 24,
                            color: _colorController.getTextColor(),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'X Tahun Pengalaman',
                        style: GoogleFonts.rubik(
                            fontSize: 17,
                            color: brownColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Psikolog Klinis',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                                  'RS Makmur Keluarga',
                                  style: GoogleFonts.rubik(
                                      color: whiteColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Gondokusuman, Yogyakarta',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                                  '+6281219425680',
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
                        'A.D Andayanti, S.Psi, P.Si adalah Psikolog Klinis yang aktif melayani pasien di RS Makmur Keluarga Gondokusuman.\n\nBeliau dapat memberikan layanan konsultasi psikologis.\n\nHarga yang tertera merupakan biaya konsultasi dokter, belum termasuk tindakan lain dan biaya admin dari RS/Klinik (apabila ada).\nKondisi dan Minat Klinis:\nGangguan kecemasan (OCD, fobia, serangan panik, atau PTSD)\nGangguan mood (depresi atau bipolar)\nKecanduan (obat-obatan, alkohol ataupun judi)\nGangguan makan (anoreksia, bulimia)\nGangguan kepribadian\nSkizofrenia atau gangguan psikosis\nFobia atau trauma\nKonflik pasien baik dengan pasangan, keluarga, teman ataupun orang lain\n\nProsedur yang dapat dilakukan:\nKonsultasi Psikologi',
                        style: GoogleFonts.rubik(
                            fontSize: 15,
                            color: _colorController.getTextColor(),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
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
                icon: Icon(
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
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    width: double.infinity,
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
                              '120.000,00',
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
