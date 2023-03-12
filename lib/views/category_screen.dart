import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/widgets/article_list.dart';
import 'package:flutter/material.dart';
import 'package:calico/widgets/category_card.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  // int index = 0;
  // late String category;
  // late Color color;

  // CategoryScreen({required this.index, required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());

    return Scaffold(
      // backgroundColor: Color(0xffD5C5F5),
      backgroundColor: Color(0xff95B2DF),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: SafeArea(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: _colorController.getTextColor(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Text(
                'Kecemasan',
                style: GoogleFonts.rubik(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.65,
              minChildSize: 0.65,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    color: _colorController.getContainerColor(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              controller: scrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 14);
                              },
                              itemBuilder: (context, index) {
                                return ArticleList();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
