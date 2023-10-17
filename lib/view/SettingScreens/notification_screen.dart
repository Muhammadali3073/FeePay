import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        text: 'Notifications'.tr,
        leading: language.value != 'English'
            ? Container()
            : IconButton(
          icon: getAssetImage('back_arrow.png', scale: 5),
          onPressed: () {
            Get.back();
          },
        ),
        actions: language.value == 'English'
            ? Container()
            : IconButton(
          icon: getAssetImage('back_arrow.png', scale: 5),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: 100.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(2.8.h),
                  getCustomTextW6S20(text: 'Today\'s'.tr, color: accentColor),
                  getVerSpace(1.8.h),
                  ListView.builder(
                    itemCount: notificationTitle.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.h, vertical: 1.h),
                        margin: EdgeInsets.only(bottom: 1.h),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.px)),
                            border: Border.all(color: borderColor, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getCustomTextW6S16(
                                        text: notificationTitle[index].toString().tr,
                                        color: accentColor),
                                    Icon(
                                      Icons.close,
                                      color: borderColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                                getCustomTextW6S14(
                                    text: notificationTitle[index].toString().tr != 'PTM'.tr
                                        ? 'M.Asad fee is due on 10/01/23.'.tr
                                        : 'Parent teacher meeting has been scheduled for next Saturday.'.tr,
                                    color: subTextColor),
                              ],
                            ),
                            getVerSpace(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                notificationTitle[index].toString().tr != 'PTM'.tr
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.3.h, horizontal: 1.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: accentColor,
                                                width: 1.px),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.px))),
                                        child: getCustomTextW6S12(
                                            text: 'Confirm'.tr,
                                            color: accentColor),
                                      ),
                                getHorSpace(0.5.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.3.h, horizontal: 1.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: redColor, width: 1.px),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.px))),
                                  child: getCustomTextW6S12(
                                      text: notificationTitle[index].toString().tr != 'PTM'.tr
                                          ? 'Pay Now!'.tr
                                          : 'Add to Calendar'.tr,
                                      color: redColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  getVerSpace(1.8.h),
                  getCustomTextW6S20(text: 'This Week'.tr, color: accentColor),
                  getVerSpace(1.8.h),
                  ListView.builder(
                    itemCount: notificationTitle.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.h, vertical: 1.h),
                        margin: EdgeInsets.only(
                            bottom: index == 4 - 1 ? 5.h : 1.2.h),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.px)),
                            border: Border.all(color: borderColor, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    getCustomTextW6S16(
                                        text: notificationTitle[index].toString().tr,
                                        color: accentColor),
                                    Icon(
                                      Icons.close,
                                      color: borderColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                                getCustomTextW6S14(
                                    text: notificationTitle[index].toString().tr != 'PTM'.tr
                                        ? 'M.Asad fee is due on 10/01/23.'.tr
                                        : 'Parent teacher meeting has been scheduled for next Saturday.'.tr,
                                    color: subTextColor),
                              ],
                            ),
                            getVerSpace(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                notificationTitle[index].toString().tr != 'PTM'.tr
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.3.h, horizontal: 1.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: accentColor,
                                                width: 1.px),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.px))),
                                        child: getCustomTextW6S12(
                                            text: 'Confirm'.tr,
                                            color: accentColor),
                                      ),
                                getHorSpace(0.5.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.3.h, horizontal: 1.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: redColor, width: 1.px),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.px))),
                                  child: getCustomTextW6S12(
                                      text: notificationTitle[index].toString().tr != 'PTM'.tr
                                          ? 'Pay Now!'.tr
                                          : 'Add to Calendar'.tr,
                                      color: redColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List notificationTitle = ['Fee Due', 'PTM'];
