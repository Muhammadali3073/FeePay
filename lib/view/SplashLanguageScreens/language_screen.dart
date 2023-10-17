
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../AuthScreens/login_screen.dart';
import '../Widgets/widget_utils.dart';

var language = 'Select your language'.obs;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var isOpenLanguage = false.obs;
  var selectedLanguage = 10001.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getWhiteColorStatusBar(),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Container(
            height: 100.h,
            width: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 2.8.h, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: getAssetImage("app_icon.png",
                        width: 22.7.h, height: 11.6.h)),
                getVerSpace(6.h),
                getCustomTextW6S14(
                  text: 'Select your preferred language'.tr,
                  color: accentColor,
                ),
                getVerSpace(1.h),
                GestureDetector(
                  onTap: () {
                    isOpenLanguage.value = !isOpenLanguage.value;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 1.3.h, vertical: 1.1.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor, width: 1.px),
                        borderRadius: BorderRadius.all(Radius.circular(10.px))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomTextW6S14(
                          text: language.toString().tr,
                          color: language.toString() == 'Select your language'
                              ? subTextColor
                              : textBlackColor,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: borderColor,
                        )
                      ],
                    ),
                  ),
                ),
                getVerSpace(1.h),
                isOpenLanguage.value
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.7.h, vertical: 1.4.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 1.px),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.px))),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: DataFile.languageList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                selectedLanguage.value = index;

                                if (DataFile.languageList[index].name
                                        .toString() ==
                                    'English') {
                                  Get.updateLocale(const Locale('en', 'US'));
                                } else {
                                  Get.updateLocale(const Locale('ur', 'PK'));
                                }

                                language.value = DataFile
                                    .languageList[index].name
                                    .toString();

                                Timer(const Duration(milliseconds: 100), () {
                                  Get.off(() => const LoginScreen());
                                });
                              },
                              child: Container(
                                color: backgroundColor,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.7.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 1.8.h,
                                        height: 1.8.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: selectedLanguage.value ==
                                                        index
                                                    ? accentColor
                                                    : borderColor,
                                                width: selectedLanguage.value ==
                                                        index
                                                    ? 4.px
                                                    : 1.5.px)),
                                      ),
                                      getHorSpace(1.2.h),
                                      getCustomTextW6S14(
                                        text: DataFile.languageList[index].name
                                            .toString()
                                            .tr,
                                        color: textBlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
