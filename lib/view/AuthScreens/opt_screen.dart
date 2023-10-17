import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/phone_auth_controller.dart';
import '../../utils/color_data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key, this.selectedPaymentMethod}) : super(key: key);

  dynamic selectedPaymentMethod;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  PhoneAuthController phoneAuthController =
      Get.find(tag: 'phoneAuthController');
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    errorController!.close();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: getAppBar(
            text: 'Enter Verification Code'.tr,
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
              width: 100.h,
              child: Column(
                children: [
                  getVerSpace(5.6.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: getCustomTextW6S14(
                        text:
                            "Please enter the OTP code we sent you on the registered phone number with student"
                                .tr,
                        color: subTextColor,
                        textAlign: TextAlign.center),
                  ),
                  getVerSpace(5.9.h),
                  PinCodeTextField(
                    autoFocus: true,
                    length: 6,
                    keyboardType: TextInputType.phone,
                    appContext: context,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        borderWidth: 1.px,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: accentColor,
                        selectedFillColor: backgroundColor,
                        inactiveColor: borderColor,
                        inactiveFillColor: backgroundColor,
                        fieldHeight: 5.5.h,
                        fieldWidth: 4.h,
                        activeColor: accentColor,
                        activeFillColor: backgroundColor,
                        fieldOuterPadding:
                            EdgeInsets.symmetric(horizontal: 1.1.h)),
                    animationDuration: const Duration(milliseconds: 200),
                    backgroundColor: backgroundColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: otpController,
                    onCompleted: (v) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      phoneAuthController.verifyOTPCode(
                          otpController: otpController);
                      log("Completed OTP:${otpController.text}");
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      log("Allowing to paste $text");
                      return true;
                    },
                  ),
                  getVerSpace(2.8.h),
                  RichText(
                    text: TextSpan(
                        text: 'Resend OTP in '.tr,
                        style: getCustomTextStyleW6S14(
                          color: subTextColor,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '${phoneAuthController.resendTimer.value} seconds',
                            style: getCustomTextStyleW6S14(
                              color: accentColor,
                            ),
                          )
                        ]),
                  ),
                  getVerSpace(1.h),
                  phoneAuthController.isResend.value
                      ? InkWell(
                          radius: 10,
                          onTap: () {
                            otpController.clear();
                            phoneAuthController.resendOtp();
                          },
                          child: RichText(
                            text: TextSpan(
                                text: 'I did not receive  the OTP   '.tr,
                                style: getCustomTextStyleW6S14(
                                  color: subTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Resend Code'.tr,
                                    style: getCustomTextStyleW6S14(
                                      color: skyBlueTextColor,
                                    ),
                                  )
                                ]),
                          ),
                        )
                      : Container(),
                  getVerSpace(3.h),
                  phoneAuthController.loadingVerifyOTPCode.value ||
                          phoneAuthController.loadingResendOTP.value
                      ? SizedBox(
                          height: 2.5.h,
                          width: 2.5.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: accentColor,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  back() {
    Get.back();
  }
}
