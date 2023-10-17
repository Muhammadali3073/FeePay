import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../SettingScreens/WalletScreens/wallet_main_screen.dart';
import '../Widgets/widget_utils.dart';

class ConfirmFeeScreen extends StatefulWidget {
  const ConfirmFeeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmFeeScreen> createState() => _ConfirmFeeScreenState();
}

class _ConfirmFeeScreenState extends State<ConfirmFeeScreen> {
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
              getCustomTextW6S25(text: 'Congratulations'.tr, color: skyBlueTextColor),
              getVerSpace(2.h),
              getCustomTextW6S17(
                  text: "Transaction has been completed\n Successfully".tr,
                  color: subTextColor,
                  textAlign: TextAlign.center),
              getVerSpace(2.h),
              getCustomTextW6S16(
                  text: "Next Monthly fee due on\n 10 Jan,2023".tr,
                  color: skyBlueTextColor),
              getVerSpace(10.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const WalletMainScreen());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.h, vertical: 0.8.h),
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  decoration: BoxDecoration(
                      color: backCardColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.px)),
                      border: Border.all(color: backCardColor, width: 1)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getCustomTextW6S14(
                                text: '3 Points Earn'.tr, color: textBlackColor),
                            getVerSpace(0.4),
                            getCustomTextW6S12(
                                text: 'Total Points 255'.tr, color: subTextColor),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.h, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(6.px)),
                        ),
                        child: getCustomTextW6S12(
                            text: 'Go to Wallet'.tr, color: textBlackColor),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
