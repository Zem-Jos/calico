import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:calico/views/expert_detail_screen.dart';
import 'package:calico/widgets/expert_online_offline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../models/expert_model.dart';

class ExpertCard extends StatelessWidget {
  final ExpertInfo expertInfo;

  const ExpertCard({
    super.key,
    required this.expertInfo,
  });

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());
    return GestureDetector(
      onTap: () {
        Get.to(() => ExpertDetailScreen(
              expertInfo: expertInfo,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: colorController.getContainerColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                expertInfo.image,
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.2,
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
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/article/article-default.png',
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  expertInfo.name,
                  style: GoogleFonts.rubik(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ExpertOnlineOffline(
                    fontSize: 10,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expertInfo.title,
                            style: GoogleFonts.rubik(
                                fontSize: 10,
                                color: brownColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            expertInfo.hospital,
                            style: GoogleFonts.rubik(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: brownColor),
                          ),
                          Text(
                            expertInfo.location,
                            style: GoogleFonts.rubik(
                                fontSize: 10,
                                color: grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          color: colorController.getBackgroundColor(),
                          child: Text(
                            expertInfo.price,
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: colorController.getTextColor(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
