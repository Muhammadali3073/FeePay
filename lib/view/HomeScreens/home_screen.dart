import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../BottomNavigationBar/bottom_nav_bar.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';
import 'AddStudentScreens/search_school_screen.dart';
import 'PayFeeMartScreens/fee_pay_mart_home_screen.dart';
import '../SettingScreens/notification_screen.dart';

var selectedStudentFromHome = 0.obs;

class WelComeScreen extends StatefulWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  int currentIndex = 0;
  final CarouselController sliderController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getWelComeAppBar(
          centerTitle: false,
          toolbarHeight: 15.h,
          text1: 'Muhammad Ali Nawaz'.tr,
          text2: '10,000',
          leading: const SizedBox(
            height: 0,
            width: 0,
          ),
          actions: InkWell(
              onTap: () {
                Get.to(() => const NotificationScreen());
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: language.value != 'English' ? 2.h : 0),
                child: getAssetImage('bell_icon.png', scale: 4),
              ))),
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                getVerSpace(2.h),
                SizedBox(
                  height: 18.h,
                  width: 100.w,
                  child: CarouselSlider(
                    items: Constant.imageSliders,
                    carouselController: sliderController,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                  ),
                ),
                getVerSpace(1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => sliderController.animateToPage(entry.key),
                      child: Container(
                        width: 10.px,
                        height: 10.px,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (currentIndex == entry.key
                                ? accentColor
                                : borderColor)),
                      ),
                    );
                  }).toList(),
                ),
                getVerSpace(1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const FeePayMartHomeScreen());
                              },
                              child: Container(
                                height: 12.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.px),
                                    ),
                                    border: Border.all(
                                        color: borderColor, width: 1.px)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_shopping_cart_rounded,
                                        color: accentColor, size: 5.h),
                                    getVerSpace(1.h),
                                    getCustomTextW6S12(
                                        text: 'FeePay Mart'.tr,
                                        color: textBlackColor),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          getHorSpace(2.h),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const SearchSchoolScreen());
                              },
                              child: Container(
                                height: 12.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.px),
                                    ),
                                    border: Border.all(
                                        color: borderColor, width: 1.px)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_circle_outline_rounded,
                                        color: accentColor, size: 5.h),
                                    getVerSpace(1.h),
                                    getCustomTextW6S12(
                                        text: 'Add Student'.tr,
                                        color: textBlackColor),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      getVerSpace(1.h),
                      Divider(color: borderColor, thickness: 1.px),
                      getVerSpace(1.h),
                      getCustomTextW6S20(
                          text: 'Students'.tr, color: accentColor),
                      getVerSpace(1.h),
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: DataFile.studentDetailsDataList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectBottomNavigationBarIndex.value = 1;
                        selectedStudentFromHome.value = index;
                      },
                      child: Container(
                        height: 12.h,
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        margin: EdgeInsets.only(
                            bottom: index ==
                                    DataFile.studentDetailsDataList.length - 1
                                ? 5.h
                                : 1.2.h),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.px)),
                            border: Border.all(color: borderColor, width: 1)),
                        child: mainCardForStudent(
                          studentName:
                              DataFile.studentDetailsDataList[index].name,
                          studentClass:
                              DataFile.studentDetailsDataList[index].grade,
                          studentInstitute: DataFile
                              .studentDetailsDataList[index].instituteName,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
