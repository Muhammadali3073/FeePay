import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var isShowPassword = true.obs;
  var isShowPassword1 = true.obs;
  var isShowPassword2 = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          appBar: getAppBar(
            text: 'Change Password'.tr,
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
                      getVerSpace(3.h),
                      getCustomTextW6S14(
                        text: 'Current Password'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPassword.value,
                        controller: currentPasswordController,
                        hintText: 'Enter Current Password'.tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password not be empty!".tr;
                          } else if (value.length <= 4) {
                            return "Password must be greater than 5 character!"
                                .tr;
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
                        text: 'New Password'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPassword1.value,
                        controller: newPasswordController,
                        hintText: 'Enter New Password'.tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password not be empty!".tr;
                          } else if (value.length <= 4) {
                            return "Password must be greater than 5 character!"
                                .tr;
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
                      ),getVerSpace(1.5.h),
                      getCustomTextW6S14(
                        text: 'Confirm New Password'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(0.7.h),
                      getCustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isShowPassword2.value,
                        controller: confirmPasswordController,
                        hintText: 'Enter Confirm Password'.tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password not be empty!".tr;
                          } else if (value.length <= 4) {
                            return "Password must be greater than 5 character!"
                                .tr;
                          } else {
                            return null;
                          }
                        },
                        suffixIcon: GestureDetector(
                            onTap: () {
                              isShowPassword2.value = !isShowPassword2.value;
                            },
                            child: isShowPassword2.value
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
                      getVerSpace(5.h),
                      InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()) {
                            Get.back();
                          }
                        },
                        child: fillColorButton(text: 'Update Password'.tr),
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
