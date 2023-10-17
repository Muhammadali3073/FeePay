import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';


class WithdrawCrypto extends StatefulWidget {
  const WithdrawCrypto({Key? key}) : super(key: key);

  @override
  State<WithdrawCrypto> createState() => _WithdrawCryptoState();
}

class _WithdrawCryptoState extends State<WithdrawCrypto> {
  TextEditingController bankController = TextEditingController();

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: getAppBar(
          text: 'Withdraw Crypto'.tr,
          leading: language.value != 'English'
              ? Container()
              : IconButton(
                  icon: getAssetImage('back_arrow.png', scale: 5),
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                ),
          actions: language.value == 'English'
              ? Container()
              : IconButton(
                  icon: getAssetImage('back_arrow.png', scale: 5),
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                ),
        ),
        body: SafeArea(
          child: Container(
            width: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 3.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(3.h),
                  getCustomTextW6S14(
                    text: 'Select Coin'.tr,
                    color: accentColor,
                  ),
                  getVerSpace(0.7.h),
                  getCustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: bankController,
                    readOnly: true,
                    hintText: 'Select Bank'.tr,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: borderColor,
                      size: 20.px,
                    ),
                  ),
                  getVerSpace(1.1.h),
                  getCustomTextW6S14(
                    text: 'Withdraw to'.tr,
                    color: accentColor,
                  ),
                  getVerSpace(0.7.h),
                  getCustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: bankController,
                    readOnly: true,
                    hintText: 'Address'.tr,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: borderColor,
                      size: 20.px,
                    ),
                  ),
                  getVerSpace(1.1.h),
                  getCustomTextW6S14(
                    text: 'Network'.tr,
                    color: accentColor,
                  ),
                  getVerSpace(0.7.h),
                  getCustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: bankController,
                    readOnly: true,
                    hintText: 'BTC Bitcoin (BTC)'.tr,
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: borderColor,
                      size: 20.px,
                    ),
                  ),
                  getVerSpace(0.5.h),
                  getCustomTextW6S14(
                      text:
                          'Wallet address automatically matched to\ncorresponding network'
                              .tr,
                      color: skyBlueTextColor),
                  getVerSpace(1.1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getCustomTextW6S14(
                        text: 'Network'.tr,
                        color: accentColor,
                      ),
                      getCustomTextW6S14(
                          text: 'BTC available'.tr, color: subTextColor)
                    ],
                  ),
                  getVerSpace(0.7.h),
                  getCustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: bankController,
                      hintText: 'BTC Bitcoin (BTC)'.tr,
                      suffixIconConstraintsWidth: 10.h,
                      suffixIcon: getCustomTextW6S14(
                          text: 'MAX   BTC'.tr, color: subTextColor)),
                  getVerSpace(0.5.h),
                  Row(
                    children: [
                      getCustomTextW6S14(
                          text: '100 BTC /100 BTC  '.tr,
                          color: skyBlueTextColor),
                      getCustomTextW6S14(
                          text: '24h remaining limit'.tr, color: subTextColor),
                    ],
                  ),
                  getVerSpace(4.9.h),
                  SizedBox(
                    width: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getAssetImage('coin_icon.png', scale: 4),
                        getCustomTextW6S14(
                            text: 'Receive amount'.tr, color: skyBlueTextColor),
                        getCustomTextW6S25(
                            text: '0.995000 BTC'.tr, color: skyBlueTextColor)
                      ],
                    ),
                  ),
                  getVerSpace(2.h),
                  fillColorButton(text: 'Withdraw'.tr),
                  getVerSpace(1.4.h),
                  outlineColorButton(text: 'Cancel'.tr),
                  getVerSpace(3.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
