import 'package:calico/theme.dart';
import 'package:calico/widgets/navigation_bar.dart';
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
  var searchController = TextEditingController();
  RangeValues _currentRangeValues = RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    String searchValue = '';
    return Scaffold(
      backgroundColor: Color(0xffFAF2ED),
      appBar: EasySearchBar(
          searchCursorColor: Color(0xffE0A071),
          searchBackIconTheme: IconThemeData(color: Color(0xffE0A071)),
          backgroundColor: Color(0xffFDFCFC),
          title: Text('hinted search text'),
          onSearch: (value) => setState(() => searchValue = value)),
      // drawer: Drawer(
      //     child: ListView(padding: EdgeInsets.zero, children: [
      //   const DrawerHeader(
      //     decoration: BoxDecoration(
      //       color: Color(0xffE0A071),
      //     ),
      //     child: Text('Drawer Header'),
      //   ),
      //   ListTile(
      //       title: const Text('Item 1'), onTap: () => Navigator.pop(context)),
      //   ListTile(
      //       title: const Text('Item 2'), onTap: () => Navigator.pop(context))
      // ])),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                      color: Color(0x993C3C43)),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFAF2ED),
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
                      color: Color(0xffFAF2ED),
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
                      color: Color(0x993C3C43)),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFAF2ED),
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
                      color: Color(0x993C3C43)),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF2ED),
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
