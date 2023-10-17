import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../BottomNavigationBar/bottom_nav_bar.dart';
import '../../Widgets/widget_utils.dart';


//ignore: must_be_immutable
class CongratulationTransferBankEWalletScreen extends StatefulWidget {
  CongratulationTransferBankEWalletScreen({Key? key, this.accountName})
      : super(key: key);
  dynamic accountName;

  @override
  State<CongratulationTransferBankEWalletScreen> createState() =>
      _CongratulationTransferBankEWalletScreenState();
}

class _CongratulationTransferBankEWalletScreenState
    extends State<CongratulationTransferBankEWalletScreen> {
  back() {
    selectBottomNavigationBarIndex.value = 0;
    Get.offAll(() => const BottomNavScreen());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        appBar: getWhiteColorStatusBar(),
        body: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getAssetImage('confirm_check.png', scale: 4),
                  getVerSpace(2.6.h),
                  getCustomTextW6S25(
                      text: 'Congratulations'.tr, color: skyBlueTextColor),
                  getVerSpace(2.h),
                  getCustomTextW6S25(text: 'PKR 7,000'.tr, color: accentColor),
                  getCustomTextW6S17(
                      text:
                          "${'has been successfully transferred to your'.tr} ${widget.accountName.toString().tr}\n\n${'Remaining Balance'.tr}\n ${'PKR 7,000'.tr}",
                      color: subTextColor,
                      textAlign: TextAlign.center),
                  getVerSpace(10.h),
                  fillColorButton(
                    text: 'Download Receipt'.tr,
                  ),
                  getVerSpace(1.5.h),
                  GestureDetector(
                      onTap: () {
                        back();
                      },
                      child: outlineColorButton(text: 'Go to Home'.tr))
                ]),
          ),
        ),
      ),
    );
  }
}
