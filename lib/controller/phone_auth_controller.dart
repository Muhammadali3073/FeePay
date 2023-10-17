import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/color_data.dart';
import '../view/AuthScreens/opt_screen.dart';
import '../view/AuthScreens/skip_screen.dart';
import '../view/HomeScreens/AddStudentScreens/congratulation_add_student_screen.dart';
import '../view/SettingScreens/WalletScreens/congratulations_add_bank.dart';
import '../view/Widgets/widget_utils.dart';

class PhoneAuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;
  Timer? timer;
  SharedPreferences? sharedPreferences;
  var remainSeconds = 1;
  var isStudentConfirm = false.obs;
  var isAddBankConfirm = false.obs;
  var isSignUp = false.obs;
  var phoneNumber = ''.obs;
  var verificationCode = ''.obs;
  var loadingVerifyUserPhoneNumber = false.obs;
  var loadingResendOTP = false.obs;
  var loadingVerifyOTPCode = false.obs;
  var resendCode = 0.obs;
  var resendTimer = '00.00'.obs;
  var isResend = false.obs;
  var selectedPaymentMethod = ''.obs;
  var phoneNumberFromSharePref = ''.obs;

  void verifyUserPhoneNumber() async {
    loadingVerifyUserPhoneNumber.value = true;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.value,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        loadingVerifyUserPhoneNumber.value = false;
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loadingVerifyUserPhoneNumber.value = false;
        Get.defaultDialog(
            backgroundColor: backgroundColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 1.5.h),
            content: getCustomTextW6S12(
                text: e.message == null
                    ? 'Something when wrong. Try again later.'
                    : e.code == 'invalid-phone-number'
                        ? 'The provided phone number is not valid.'
                        : e.message.toString(),
                textAlign: TextAlign.center,
                color: textBlackColor));
      },
      codeSent: (String verificationId, int? resendToken) {
        loadingVerifyUserPhoneNumber.value = false;
        isResend.value = false;
        verificationCode.value = verificationId;
        resendCode.value = resendToken!;
        startTimer(60);
        Get.to(() => OTPScreen(
              selectedPaymentMethod: selectedPaymentMethod.value,
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        loadingVerifyUserPhoneNumber.value = false;
        verificationId = verificationCode.value;
      },
    );
  }

  void resendOtp() async {
    loadingResendOTP.value = true;
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.value,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        loadingResendOTP.value = false;
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loadingResendOTP.value = false;
        Get.defaultDialog(
            backgroundColor: backgroundColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 1.5.h),
            content: getCustomTextW6S12(
                text: e.message == null
                    ? 'Something when wrong. Try again later.'
                    : e.code == 'invalid-phone-number'
                        ? 'The provided phone number is not valid.'
                        : e.message.toString(),
                textAlign: TextAlign.center,
                color: textBlackColor));
      },
      codeSent: (String verificationId, int? resendToken) {
        loadingResendOTP.value = false;
        isResend.value = false;
        verificationId = verificationCode.value;
        startTimer(60);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        loadingResendOTP.value = false;
        verificationId = verificationCode.value;
      },
      forceResendingToken: resendCode.value,
    );
  }

  Future<void> verifyOTPCode({otpController}) async {
    loadingVerifyOTPCode.value = true;
    sharedPreferences = await SharedPreferences.getInstance();
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode.value,
        smsCode: otpController.text,
      );
      await auth.signInWithCredential(credential).then((value) {
        loadingVerifyOTPCode.value = false;
        sharedPreferences!.setString('phoneNumber', phoneNumber.value);
        getPhoneNumberFromSharePref();
        if (timer != null) {
          resendTimer.value = '00.00';
          timer!.cancel();
        }
        isSignUp.value
            ? Get.off(() => const SkipScreen())
            : isAddBankConfirm.value
                ? Get.to(() => CongratulationAddBankScreen(
                      selectedPaymentMethod: selectedPaymentMethod.value,
                    ))
                : Get.to(() => const CongratulationAddStudentScreen());
      });
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
          backgroundColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.5.h),
          content: getCustomTextW6S12(
              text: e.message == null
                  ? 'Something when wrong. Try again later.'
                  : e.message.toString(),
              textAlign: TextAlign.center,
              color: textBlackColor));
      loadingVerifyOTPCode.value = false;
    } on PlatformException catch (e) {
      Get.defaultDialog(
          backgroundColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.5.h),
          content: getCustomTextW6S12(
              text: e.message.toString(),
              textAlign: TextAlign.center,
              color: textBlackColor));
      loadingVerifyOTPCode.value = false;
    } catch (e) {
      Get.defaultDialog(
          backgroundColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 1.5.h),
          content: getCustomTextW6S12(
              text: e.toString(),
              textAlign: TextAlign.center,
              color: textBlackColor));
      loadingVerifyOTPCode.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }

  startTimer(int seconds) {
    remainSeconds = seconds;
    const duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == -1) {
        isResend.value = true;
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        resendTimer.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }

  @override
  void onReady() {
    startTimer(60);
    super.onReady();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.onClose();
  }

  void getPhoneNumberFromSharePref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.getString('phoneNumber') == null ||
            sharedPreferences!.getString('phoneNumber')!.isEmpty
        ? phoneNumberFromSharePref.value = ''
        : phoneNumberFromSharePref.value =
            sharedPreferences!.getString('phoneNumber')!;
  }
}
