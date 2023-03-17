import 'package:calico/controllers/mood_controller.dart';
import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Map<String, String>? moodDescriptions = {
  'senang':
      'Senang mendengarnya! Nikmatilah momenmu  dan jangan lupa untuk bersyukur atas hal baik yang kamu alami!',
  'biasa':
      'Itu hal yang wajar! Memang ada hari yang seperti itu. Tetap semangat dan terus berjuang!',
  'sedih':
      'Hari-hari seperti ini memang sulit. Ingat bahwa kamu sangat berarti.  Calico siap membantumu melewatinya.',
  'marah':
      'Terkadang emosi yang kuat sulit untuk dikendalikan. Ingatlah untuk tenangkan dirimu saat ini.',
  'cemas':
      'Nafas dalam-dalam dan coba untuk kendalikan pikiranmu. Ingat! perasaan cemasmu tidak akan berlangsung selamanya.',
  'lelah':
      'Terkadang, hidup bisa sangat melelahkan. Sisihkanlah waktu untuk istirahat dan melakukan hal yang kamu nikmati',
  'kecewa':
      'Tenang, masih banyak kesempatan lain.  Kekecewaan hanyalah sementara dan kamu pasti bisa bangkit kembali!',
  'takut':
      'Cobalah bernafas dalam-dalam dan tenangkan dirimu. Identifikasilah apa yang membuatmu takut dan cari bantuan.',
  'hampa':
      'Terkadang kita merasa kehilangan arah atau tujuan. Ambilah waktu untuk merenung dan cari tahu apa yang penting bagimu.',
  'semangat':
      'Yay! pertahankan semangatmu dan tetap fokus pada hal-hal positif. Sisihkanlah waktu untuk menikmati momenmu.'
  // Add more mood descriptions here
};

class MoodBoard extends StatefulWidget {
  const MoodBoard({super.key});

  @override
  State<MoodBoard> createState() => _MoodBoardState();
}

class _MoodBoardState extends State<MoodBoard> {
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find<ThemeController>();
    final ColorController _colorController = Get.put(ColorController());
    final MoodController _moodController = Get.put(MoodController());

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: grayColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        color: _colorController.getContainerColor(),
      ),
      child: GetBuilder<MoodController>(
        builder: (controller) {
          return controller.selectedMood.value.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned(
                        // top: 30,
                        bottom: -50,
                        left: -45,
                        child: Hero(
                          tag: 'mood',
                          child: Opacity(
                            opacity: 0.1,
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/${_moodController.selectedMood()}_dark.png'
                                  : 'assets/images/mood/${_moodController.selectedMood()}.png',
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _moodController.selectedMood().toUpperCase(),
                              style: GoogleFonts.rubik(
                                  color: brownColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              moodDescriptions![
                                  _moodController.selectedMood()]!,
                              style: GoogleFonts.rubik(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _moodController.clearMood();
                                });
                              },
                              child: Text(
                                'Lihat statistik',
                                style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  color: brownColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bagaimana Suasana Hatimu Hari Ini?',
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: _colorController.getTextColor(),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('senang');
                              });
                            },
                            child: Image.asset(
                              width: 52,
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/senang_dark.png'
                                  : 'assets/images/mood/senang.png',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('biasa');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/biasa_dark.png'
                                  : 'assets/images/mood/biasa.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('sedih');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/sedih_dark.png'
                                  : 'assets/images/mood/sedih.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('marah');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/marah_dark.png'
                                  : 'assets/images/mood/marah.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('cemas');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/cemas_dark.png'
                                  : 'assets/images/mood/cemas.png',
                              width: 52,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('lelah');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/lelah_dark.png'
                                  : 'assets/images/mood/lelah.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('kecewa');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/kecewa_dark.png'
                                  : 'assets/images/mood/kecewa.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('takut');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/takut_dark.png'
                                  : 'assets/images/mood/takut.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('hampa');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/hampa_dark.png'
                                  : 'assets/images/mood/hampa.png',
                              width: 52,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _moodController.selectMood('semangat');
                              });
                            },
                            child: Image.asset(
                              _themeController.isDarkMode.value
                                  ? 'assets/images/mood/semangat_dark.png'
                                  : 'assets/images/mood/semangat.png',
                              width: 52,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
