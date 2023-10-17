import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({Key? key}) : super(key: key);

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: getAppBar(
            text: 'Fees'.tr,
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
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SizedBox(
              width: 100.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: accentColor,
                      child: TabBar(
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.px,
                          fontFamily: Constant.fontsFamily,
                        ),
                        indicatorColor: textWhiteColor,
                        labelColor: textWhiteColor,
                        unselectedLabelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.px,
                          fontFamily: Constant.fontsFamily,
                        ),
                        unselectedLabelColor: borderColor,
                        overlayColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.transparent;
                          }
                          return Colors.transparent;
                        }),
                        tabs: tabs,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: views,
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }

  List<Tab> tabs = [
    Tab(text: 'Payment History'.tr),
    Tab(text: 'Dues'.tr),
  ];

  static List<Widget> views = [
    const CardOfFees(),
    const CardOfDues(),
  ];
}

class CardOfFees extends StatefulWidget {
  const CardOfFees({Key? key}) : super(key: key);

  @override
  State<CardOfFees> createState() => _CardOfFeesState();
}

class _CardOfFeesState extends State<CardOfFees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: DataFile.feesDetailsModel.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
                left: 2.5.h, right: 2.5.h, bottom: 1.h, top: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor, width: 1.px),
              borderRadius: BorderRadius.all(Radius.circular(15.px)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomTextW6S20(
                            text: DataFile.feesDetailsModel[index].feeTitle
                                .toString()
                                .tr,
                            color: accentColor),
                        getCustomTextW6S12(
                            text: DataFile.feesDetailsModel[index].studentName
                                .toString()
                                .tr,
                            color: subTextColor),
                        getCustomTextW6S12(
                            text:
                                '${'Class'.tr} : ${DataFile.feesDetailsModel[index].grade.toString().tr}',
                            color: subTextColor),
                        getCustomTextW6S9(
                            text:
                                '${'Institute'.tr} : ${DataFile.feesDetailsModel[index].instituteName.toString().tr}',
                            color: subTextColor),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        getCustomTextW6S16(
                            text: DataFile
                                .feesDetailsModel[index].statusOfPayment
                                .toString()
                                .tr,
                            color: accentColor),
                        getVerSpace(0.5.h),
                        getCustomTextW6S12(
                            text: DataFile.feesDetailsModel[index].dateOfPayment
                                .toString()
                                .tr,
                            color: subTextColor),
                        getVerSpace(0.5.h),
                        getCustomTextW6S12(
                            text: DataFile
                                .feesDetailsModel[index].amountOfPayment
                                .toString()
                                .tr,
                            color: subTextColor),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: borderColor,
                ),
                getCustomTextW6S12(
                    text: DataFile.feesDetailsModel[index].paymentMethodDetail
                        .toString()
                        .tr,
                    color: subTextColor),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CardOfDues extends StatefulWidget {
  const CardOfDues({Key? key}) : super(key: key);

  @override
  State<CardOfDues> createState() => _CardOfDuesState();
}

class _CardOfDuesState extends State<CardOfDues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: DataFile.duesDetailsModel.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
                left: 2.5.h, right: 2.5.h, bottom: 1.h, top: 2.h),
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: borderColor, width: 1.px),
              borderRadius: BorderRadius.all(Radius.circular(15.px)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomTextW6S20(
                            text: DataFile.duesDetailsModel[index].feeTitle
                                .toString()
                                .tr,
                            color: accentColor),
                        getCustomTextW6S12(
                            text: DataFile.duesDetailsModel[index].studentName
                                .toString()
                                .tr,
                            color: subTextColor),
                        getCustomTextW6S12(
                            text:
                                '${'Class'.tr} : ${DataFile.duesDetailsModel[index].grade.toString().tr}',
                            color: subTextColor),
                        getCustomTextW6S9(
                            text:
                                '${'Institute'.tr} : ${DataFile.duesDetailsModel[index].instituteName.toString().tr}',
                            color: subTextColor),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        getCustomTextW6S16(
                            text: DataFile
                                .duesDetailsModel[index].statusOfPayment
                                .toString()
                                .tr,
                            color: accentColor),
                        getVerSpace(0.5.h),
                        getCustomTextW6S12(
                            text: DataFile.duesDetailsModel[index].dateOfPayment
                                .toString()
                                .tr,
                            color: subTextColor),
                        getVerSpace(0.5.h),
                        getCustomTextW6S12(
                            text: DataFile
                                .duesDetailsModel[index].amountOfPayment
                                .toString()
                                .tr,
                            color: subTextColor),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: borderColor,
                ),
                getCustomTextW6S12(
                    text: DataFile.duesDetailsModel[index].paymentMethodDetail
                        .toString()
                        .tr,
                    color: subTextColor),
              ],
            ),
          );
        },
      ),
    );
  }
}
