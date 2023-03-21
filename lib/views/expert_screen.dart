import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/widgets/expert_card.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpertScreen extends StatefulWidget {
  ExpertScreen({super.key});

  @override
  State<ExpertScreen> createState() => _ExpertScreenState();
}

class _ExpertScreenState extends State<ExpertScreen> {
  final ThemeController _themeController = Get.find<ThemeController>();
  final ColorController _colorController = Get.put(ColorController());
  var searchController = TextEditingController();
  RangeValues _currentRangeValues = RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    String searchValue = '';
    return Scaffold(
      backgroundColor: _colorController.getBackgroundColor(),
      appBar: EasySearchBar(
          searchCursorColor: Color(0xffE0A071),
          searchBackIconTheme: IconThemeData(color: Color(0xffE0A071)),
          backgroundColor: _colorController.getBackgroundColor(),
          title: Text('Cari Psikolog'),
          onSearch: (value) => setState(() => searchValue = value)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: edge,
          ),
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return ExpertCard();
              }),
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        color: _colorController.getBackgroundColor(),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: edge),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Lokasi',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: _colorController.getTextColor()),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      isExpanded: true,
                      hint: Text('Pilih Lokasi'),
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
                SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      isExpanded: true,
                      hint: Text('Pilih Lokasi'),
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Tipe Sesi',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: _colorController.getTextColor()),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      isExpanded: true,
                      hint: Text('Pilih Lokasi'),
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Range Harga',
                  style: GoogleFonts.rubik(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: _colorController.getTextColor()),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: _colorController.getContainerColor(),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Center(
                    child: Text('pokok range harga'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('40'), Text('80')],
                ),
                RangeSlider(
                  activeColor: Color(0xffC97D50),
                  inactiveColor: Color(0xffE1A071),
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
                    decoration: BoxDecoration(
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
