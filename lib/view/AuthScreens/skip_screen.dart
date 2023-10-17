import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../BottomNavigationBar/bottom_nav_bar.dart';
import '../Widgets/widget_utils.dart';

class SkipScreen extends StatefulWidget {
  const SkipScreen({Key? key}) : super(key: key);

  @override
  State<SkipScreen> createState() => _SkipScreenState();
}

class _SkipScreenState extends State<SkipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: skipBDColor,
      appBar: getSkipStatusBar(),
      body: SafeArea(
        child: SizedBox(
          width: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCustomTextW6S16(
                  text: "Searching Students by given\n phone numbers".tr,
                  color: subTextColor),
              getVerSpace(10.h),
              CupertinoActivityIndicator(
                radius: 12.0.h,
                animating: true,
              ),
              getVerSpace(10.h),
              GestureDetector(
                onTap: () {
                  selectBottomNavigationBarIndex.value = 0;
                  Get.offAll(() => const BottomNavScreen());
                },
                child: Container(
                  height: 5.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 12.h),
                  decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30.px),
                          right: Radius.circular(30.px))),
                  child:
                      getCustomTextW6S17(text: 'Skip'.tr, color: backgroundColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
