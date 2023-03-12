import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// class ArticleCard extends StatelessWidget {
//   const ArticleCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ColorController _colorController = Get.put(ColorController());
//     return Padding(
//       padding: EdgeInsets.only(bottom: 26),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             color: _colorController.getContainerColor(),
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0xff433230).withOpacity(0.15),
//                 spreadRadius: 0,
//                 blurRadius: 15,
//                 offset: const Offset(0, 4), // changes position of shadow
//               ),
//             ]),
//         width: 243,
//         height: 240,
//         margin: EdgeInsets.only(right: 24),
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/images/article/article.png',
//               width: 243,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               height: 80,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     '5 Hal yang dapat membantu kecemasanmu!',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: _colorController.getTextColor(),
//                     ),
//                   ),
//                   Text(
//                     'Kecemasan',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                       color: grayColor,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class ArticleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorController _colorController = Get.put(ColorController());
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Container(
          decoration: BoxDecoration(
            color: _colorController.getBackgroundColor(),
            boxShadow: [
              BoxShadow(
                color: Color(0xff433230).withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          width: 243,
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/article/article.png',
                    width: 243,
                    height: 135,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '5 Hal yang dapat membantu kecemasanmu!',
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: _colorController.getTextColor(),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Kecemasan • 5 Menit',
                        style: GoogleFonts.rubik(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: grayColor,
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
