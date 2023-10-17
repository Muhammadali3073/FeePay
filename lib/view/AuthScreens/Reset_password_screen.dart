import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var isShowPassword = true.obs;
  var isShowPassword1 = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
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
                        text: 'Reset Password'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(5.h),
                      getCustomTextW6S14(
                        text: 'Password'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPassword.value,
                        controller: passwordController,
                        hintText: 'Enter Your Password'.tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password not be empty!".tr;
                          } else if (value.length <= 4) {
                            return "Password must be greater than 5 character!".tr;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isShowPassword.value = !isShowPassword.value;
                            },
                            child: isShowPassword.value
                                ? Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: textBlackColor,
                                    size: 20.px,
                                  )
                                : Icon(
                                    Icons.password,
                                    color: textBlackColor,
                                    size: 20.px,
                                  )),
                      ),
                      getVerSpace(1.5.h),
                      getCustomTextW6S14(
                        text: 'Confirm Password'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPassword1.value,
                        controller: confirmPasswordController,
                        hintText: 'Enter Your Password'.tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password not be empty!".tr;
                          } else if (value.length <= 4) {
                            return "Password must be greater than 5 character!".tr;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isShowPassword1.value = !isShowPassword1.value;
                            },
                            child: isShowPassword1.value
                                ? Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: textBlackColor,
                                    size: 20.px,
                                  )
                                : Icon(
                                    Icons.password,
                                    color: textBlackColor,
                                    size: 20.px,
                                  )),
                      ),
                      getVerSpace(3.1.h),
                      InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            Get.to(() => const LoginScreen());
                          }

                        },
                        child: fillColorButton(text: 'Reset Password'.tr),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
