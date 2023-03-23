import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/expert_card.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/expert_model.dart';

class ExpertScreen extends StatefulWidget {
  ExpertScreen({super.key});

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  var searchController = TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    String searchValue = '';
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: EasySearchBar(
          // ignore: prefer_const_constructors
          searchCursorColor: Color(0xffE0A071),
          searchBackIconTheme: const IconThemeData(color: Color(0xffE0A071)),
          backgroundColor: _colorController.getBackgroundColor(),
          title: const Text('Cari Psikolog'),
          onSearch: (value) => setState(() => searchValue = value)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: edge,
          ),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: expertList.length,
              itemBuilder: (context, index) {
                // convert to ExpertModel
                final json = expertList[index];
                ExpertInfo expertInfo = ExpertInfo.fromJson(json);
                return ExpertCard(
                  expertInfo: expertInfo,
                );
              }),
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        color: _colorController.getBackgroundColor(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: edge),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 105,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: GoogleFonts.rubik(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/icon/cross.png',
                        width: 25,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Lokasi',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: _colorController.getTextColor()),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      isExpanded: true,
                      hint: const Text('Pilih Lokasi'),
                      items: ['satu', 'dua', 'tiga']
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      isExpanded: true,
                      hint: const Text('Pilih Lokasi'),
                      items: ['satu', 'dua', 'tiga']
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Tipe Sesi',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: _colorController.getTextColor()),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      isExpanded: true,
                      hint: const Text('Pilih Lokasi'),
                      items: ['satu', 'dua', 'tiga']
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Range Harga',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: _colorController.getTextColor()),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: const Center(
                    child: Text('pokok range harga'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('40'), const Text('80')],
                ),
                RangeSlider(
                  activeColor: const Color(0xffC97D50),
                  inactiveColor: const Color(0xffE1A071),
                  values: _currentRangeValues,
                  max: 100,
                  divisions: 9,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: const BoxDecoration(
                        color: brownColor,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        'Terapkan Filter',
                        style: GoogleFonts.rubik(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> expertList = [
  {
    "name": "Fitriani Putri, M.Psi",
    "title": "Psikolog Non Klinis",
    "hospital": "RS Makmur Keluarga",
    "location": "Gondomanan, Yogyakarta",
    "option": "online",
    "image":
        "https://images.unsplash.com/photo-1601869610370-907c3e63d7e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "price": "160,900",
    "address": "Jl. Sultan Agung No. 54, Kel. Prawirodirjan, Kec. Gondomanan",
    "phone": "0812-5643-3211",
    "description":
        "Fitriani adalah seorang psikolog yang berpengalaman dalam bidang konseling dan terapi keluarga. Dia terkenal karena kesabaran dan kehangatan dalam membantu kliennya mengatasi masalah-masalah pribadi dan hubungan antar manusia. Fitriani sangat terampil dalam membantu kliennya meningkatkan hubungan interpersonal, memperkuat keterampilan komunikasi, dan meningkatkan kemampuan mengelola stres."
  },
  {
    "name": "Maya Dewi, M.Psi, Psikolog",
    "title": "Psikolog Klinis",
    "hospital": "RS Sari Asih",
    "location": "Mlati, Surakarta",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1607990283143-e81e7a2c9349?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1682&q=80",
    "price": "287,550",
    "address": "Jl. Godean No. 178, Kel. Sinduadi, Kec. Mlati",
    "phone": "0878-8909-5432",
    "description":
        "Maya Dewi adalah seorang psikolog klinis dengan fokus pada pengobatan gangguan kecemasan dan depresi. Dia memiliki pengalaman dalam menggunakan pendekatan kognitif-perilaku untuk membantu kliennya mengatasi masalah kesehatan mental. Maya juga sangat sensitif terhadap isu-isu kebudayaan dan agama yang mempengaruhi kesehatan mental kliennya."
  },
  {
    "name": "Sarah Hidayah, S.Psi",
    "title": "Psikolog Klinis Dewasa",
    "hospital": "RS Anugerah Medika",
    "location": "Jetis, Klaten",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1573497019418-b400bb3ab074?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "price": "168,350",
    "address": "Jl. Taman Siswa No. 83, Kel. Tegalrejo, Kec. Jetis",
    "phone": "08532345-6789",
    "description":
        "Sarah adalah seorang psikolog yang bijaksana dan tenang. Dia cenderung mempertimbangkan semua sudut pandang sebelum membuat keputusan. Sarah memiliki keahlian dalam membantu klien mengatasi masalah emosi dan merasa lebih baik secara keseluruhan."
  },
  {
    "name": "dra. Ratih Amalia, MA",
    "title": "Psikolog Klinis, Hipnoterapis",
    "hospital": "RS Jaya Sehat",
    "location": "Jetis, Klaten",
    "option": "offline",
    "image":
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "price": "324,125",
    "address": "Jl. Diponegoro No. 45 , Kel. Gowongan, Kec. Jetis",
    "phone": "0811-9987-6543",
    "description":
        "Ratih adalah seorang psikolog yang memiliki kemampuan empati yang tinggi. Dia cenderung sangat sensitif terhadap perasaan orang lain dan senang membantu orang lain dalam memecahkan masalah. Ratih juga cenderung menjadi sangat perfeksionis, tetapi belajar untuk lebih menghargai dirinya sendiri dan mengatasi rasa cemas."
  },
  {
    "name": "Nisa Anwar, S.Psi, M.Psi",
    "title": "Psikolog Non Klinis",
    "hospital": "RS Cipta Medika",
    "location": "Gondokusuman, Sleman",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1619545307432-9fc73f8135ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80",
    "price": "190,825",
    "address": "Jl. Cendana No. 67, Kel. Baciro, Kec. Gondokusuman",
    "phone": "0813-4321-9876",
    "description":
        "Nisa adalah seorang psikolog yang memiliki kecenderungan untuk menjadi sangat terorganisir dan detail dalam pekerjaannya. Dia sangat terampil dalam menemukan solusi masalah dan membantu klien mencapai tujuan mereka. Nisa juga memiliki kecenderungan untuk menjadi perfeksionis dan belajar untuk lebih santai dan fleksibel dalam pekerjaannya."
  },
  {
    "name": "Rika Indriani, S.Psi, M.Psi",
    "title": "Psikolog Klinis",
    "hospital": "RS Sentosa",
    "location": "Gondomanan, Yogyakarta",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1642790828402-00e671e7805e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3011&q=80",
    "price": "212,750",
    "address": "Jl. Taman Pintar No. 21, Kel. Ngupasan, Kec. Gondomanan",
    "phone": "0822-4567-8901",
    "description":
        "Rika adalah seorang psikolog yang memiliki kecenderungan untuk menjadi sangat analitis dalam pekerjaannya. Dia sangat ahli dalam memecahkan masalah kompleks dan senang membantu klien mencapai tujuan mereka. Rika juga cenderung menjadi keras pada dirinya sendiri dan belajar untuk lebih menghargai dirinya sendiri."
  },
  {
    "name": "Dika Saputra, S.Psi",
    "title": "Psikolog Klinis",
    "hospital": "RS Puspa Husada",
    "location": "Gondomanan, Yogyakarta",
    "option": "offline",
    "image":
        "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "price": "352,050",
    "address":
        "Jl. Imogiri Timur No. 98, RT 08 RW 02, Kel. Wijilan, Kec. Gondomanan",
    "phone": "0896-1234-5678",
    "description":
        "Dika adalah seorang psikolog yang terbuka, ramah, dan dapat dengan mudah beradaptasi dengan lingkungan baru. Dia cenderung menjadi sangat percaya diri dan senang membantu klien dalam memecahkan masalah. Dika juga belajar untuk menjadi lebih sabar dan mengatasi rasa cemas."
  },
  {
    "name": "Ryan Maulana, M.Psi, Psikolog",
    "title": "Psikolog Klinis Dewasa",
    "hospital": "RS Graha Medika",
    "location": "Tegalrejo, Sleman",
    "option": "offline",
    "image":
        "https://images.unsplash.com/photo-1615813967515-e1838c1c5116?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "price": "257,475",
    "address": "Jl. Abu Bakar Ali No. 31, Kel. Karangwaru, Kec. Tegalrejo",
    "phone": "0812-3456-7890",
    "description":
        "Ryan adalah seorang psikolog yang terampil dalam memecahkan masalah dan membantu klien mencapai tujuan mereka. Dia cenderung menjadi sangat percaya diri dan senang dalam lingkungan yang kompetitif. Ryan juga belajar untuk menjadi lebih fleksibel dan membuka diri terhadap pendapat orang lain."
  },
  {
    "name": "Fauzan Satria, M.Psi, Psikolog",
    "title": "Psikolog Klinis",
    "hospital": "RS Sumber Sehat",
    "location": "Ngampilan, Bantul",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
    "price": "189,625",
    "address": "Jl. Ahmad Yani No. 74, Kel. Tegalpanggung, Kec. Ngampilan",
    "phone": "0877-8901-2345",
    "description":
        "Fauzan adalah seorang psikolog yang memiliki kecenderungan untuk menjadi sangat sabar dan teliti dalam pekerjaannya. Dia sangat ahli dalam menemukan solusi masalah dan membantu klien mencapai tujuan mereka. Fauzan juga cenderung menjadi perfeksionis dan belajar untuk lebih santai dalam pekerjaannya."
  },
  {
    "name": "Muhammad Farhan  S.Psi, M.Psi",
    "title": "Psikolog Klinis, Hipnoterapis",
    "hospital": "RS Bumi Sehat",
    "location": "Gondokusuman, Sleman",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1512485694743-9c9538b4e6e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
    "price": "277,850",
    "address": "Jl. Gajah Mada No. 35, Kel. Terban, Kec. Gondokusuman",
    "phone": "0823-6789-0123",
    "description":
        "Muhammad Farhan adalah seorang psikolog klinis dengan spesialisasi dalam konseling keluarga dan pernikahan. Beliau sangat berpengalaman dalam membantu pasangan yang mengalami masalah komunikasi, konflik, dan kesulitan dalam hubungan mereka. Selain itu, Muhammad Farhan juga memiliki keahlian dalam membantu individu yang mengalami depresi, kecemasan, dan stres. Beliau memahami bahwa setiap individu memiliki kebutuhan yang berbeda-beda dan memperhatikan setiap pasien dengan cermat untuk dapat memberikan solusi terbaik bagi mereka. Layanan konsultasi psikologis yang diberikan oleh Muhammad Farhan sangat terkenal di kalangan masyarakat dan sering kali membantu pasien meraih kebahagiaan dan kesejahteraan mental."
  },
  {
    "name": "drs. Budi Prasetyo Pratama, MA",
    "title": "Psikolog Klinis",
    "hospital": "RS Medika Jaya",
    "location": "Depok, Yogyakarta",
    "option": "hybrid",
    "image":
        "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80",
    "price": "168,350",
    "address": "Jl. Kaliurang No. 112, Kel. Demangan, Kec. Depok",
    "phone": "",
    "description":
        "Budi Prasetyo adalah seorang psikolog klinis yang terkenal dengan kemampuannya dalam memberikan terapi kognitif-behavioral yang efektif untuk pasien dengan gangguan kecemasan, gangguan mood, dan masalah hubungan interpersonal. Beliau telah berpengalaman lebih dari 10 tahun dalam praktek klinis dan telah membantu banyak pasien untuk memperoleh kesehatan mental yang optimal. Muhammad Farhan dikenal sebagai sosok yang empatik dan sabar dalam mendengarkan masalah pasien, sehingga pasien merasa nyaman dalam berbicara mengenai masalah pribadinya. Biaya konsultasi dengan Muhammad Farhan cukup terjangkau dan sesuai dengan standar harga di klinik tempat beliau berpraktek."
  }
];
