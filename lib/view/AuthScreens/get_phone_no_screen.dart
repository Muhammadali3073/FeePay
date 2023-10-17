import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/phone_auth_controller.dart';
import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class GetPhoneNumberScreen extends StatefulWidget {
  const GetPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<GetPhoneNumberScreen> createState() => _GetPhoneNumberScreenState();
}

class _GetPhoneNumberScreenState extends State<GetPhoneNumberScreen> {
  PhoneAuthController phoneAuthController =
      Get.find(tag: 'phoneAuthController');
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PhoneNumber initialCountry = PhoneNumber(isoCode: 'PK');

  var isShowPassword = true.obs;

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
                        text: 'Create an account'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(5.h),
                      getCustomTextW6S14(
                        text: 'Phone Number'.tr,
                        color: accentColor,
                      ),
                      getVerSpace(0.7.h),
                      InternationalPhoneNumberInput(
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle:
                        const TextStyle(color: Colors.black),
                        initialValue: initialCountry,
                        textFieldController: phoneController,
                        formatInput: true,
                        keyboardType: TextInputType.phone,
                        isEnabled: true,
                        inputDecoration: InputDecoration(
                          isDense: true,
                          isCollapsed: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor, width: 1.0.px),
                              borderRadius: BorderRadius.circular(10.0.px)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor, width: 1.0.px),
                              borderRadius: BorderRadius.circular(10.0.px)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.px)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 1.3.h, horizontal: 1.3.h),
                          fillColor: backgroundColor,
                          hintText: 'Enter Your Phone Number'.tr,
                          hintStyle: getCustomTextStyleW6S14(
                            color: hintTextColor,
                          ),
                          enabled: true,
                        ),
                        cursorColor: textBlackColor,
                        onInputChanged: (PhoneNumber number) {
                          phoneAuthController.phoneNumber.value =
                              number.phoneNumber.toString();
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        onSaved: (PhoneNumber pNumber) {
                          log('On Saved: $pNumber');
                        },
                      ),
                      getVerSpace(1.2.h),
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
                      getVerSpace(3.1.h),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            phoneAuthController.isSignUp.value = true;
                            phoneAuthController.isAddBankConfirm.value = false;
                            phoneAuthController.isStudentConfirm.value = false;

                            FocusManager.instance.primaryFocus?.unfocus();
                            phoneAuthController.verifyUserPhoneNumber();
                          }
                        },
                        child: fillColorButton(text: 'Sign Up'.tr,loading: phoneAuthController
                            .loadingVerifyUserPhoneNumber.value),
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
