import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'Reset_password_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: getWhiteColorStatusBar(),
        body: SafeArea(
          child: Container(
            width: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 2.8.h, vertical: 3.8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () => Get.back(),
                        child: Icon(Icons.arrow_back_rounded,
                            color: accentColor, size: 3.h)),
                    getVerSpace(2.h),
                    getCustomTextW6S25(
                      text: 'Forgot Password?'.tr,
                      color: accentColor,
                    ),
                    getCustomTextW6S14(
                      text:
                          'Don’t worry! It happens. Please enter the\nemail address associated with your account.'
                              .tr,
                      color: subTextColor,
                    ),
                    getVerSpace(5.h),
                    getCustomTextW6S14(
                      text: 'Email'.tr,
                      color: accentColor,
                    ),
                    getVerSpace(0.7.h),
                    getCustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hintText: 'Enter Your Email'.tr,
                      controller: emailController,
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Please enter a valid email".tr,
                    ),
                    getVerSpace(3.3.h),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Get.to(() => const ResetPassword());
                        }
                      },
                      child: fillColorButton(text: 'Submit'.tr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
