import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../BottomNavigationBar/bottom_nav_bar.dart';
import '../../Widgets/widget_utils.dart';



class CongratulationAddStudentScreen extends StatefulWidget {
  const CongratulationAddStudentScreen({Key? key}) : super(key: key);

  @override
  State<CongratulationAddStudentScreen> createState() =>
      _CongratulationAddStudentScreenState();
}

class _CongratulationAddStudentScreenState
    extends State<CongratulationAddStudentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      selectBottomNavigationBarIndex.value = 0;
      Get.offAll(() => const BottomNavScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getWhiteColorStatusBar(),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getAssetImage('confirm_check.png', scale: 4),
              getVerSpace(2.6.h),
              getCustomTextW6S25(
                  text: 'Congratulations'.tr, color: skyBlueTextColor),
              getVerSpace(2.h),
              getCustomTextW6S17(
                  text: "Student has been added\n Successfully".tr,
                  color: subTextColor,
                  textAlign: TextAlign.center),
            ]),
      ),
    );
  }
}
