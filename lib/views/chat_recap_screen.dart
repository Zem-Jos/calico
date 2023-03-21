import 'package:calico/controllers/theme_controller.dart';
import 'package:calico/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/calendar_controller.dart';
import '../utils/date_util.dart';

class ChatRecapScreen extends StatelessWidget {
  ChatRecapScreen({super.key});
  final RxBool isVisible = true.obs;

  final CalendarController calendarController = Get.find();

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        backgroundColor: colorController.getBackgroundColor(),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: SafeArea(
            child: Container(
              height: 65,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: brownColor,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Riwayat Chat',
                        style: GoogleFonts.rubik(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            GetBuilder<CalendarController>(
              builder: (controller) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      itemCount: controller.selectedMessages.length + 1,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 10),
                      itemBuilder: (context, index) {
                        List<dynamic> messageList = <dynamic>[
                          const SizedBox(height: 40),
                        ];
                        // append all messages to the list
                        messageList.addAll(controller.selectedMessages);

                        if (index == 0) {
                          return messageList[index];
                        }

                        return Container(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Align(
                            alignment:
                                (messageList[index].messageSender == 'calico'
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    (messageList[index].messageSender ==
                                            'calico'
                                        ? const BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))
                                        : const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                color: (messageList[index].messageSender ==
                                        'calico'
                                    ? colorController.getCalicoChatColor()
                                    : colorController.getUserChatColor()),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: SelectableText(
                                messageList[index].messageContent,
                                style: GoogleFonts.rubik(
                                  fontSize: 17,
                                  color: (messageList[index].messageSender ==
                                          'calico'
                                      ? colorController.getCalicoChatTextColor()
                                      : colorController.getUserChatTextColor()),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: edge),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  height: isVisible.value ? 40 : 0,
                  width: double.infinity,
                  color: whiteColor.withOpacity(0.7),
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    DateUtil.instance.getFormattedDateStr(
                        calendarController.selectedDay.value!),
                    style: GoogleFonts.rubik(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
