import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:payfee/controller/phone_auth_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/facebook_sign_in_controller.dart';
import '../../controller/google_sign_in_controller.dart';
import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'get_phone_no_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  GoogleSignInController googleSignInController =
      Get.find(tag: 'googleSignInController');
  FaceBookSignInController faceBookSignInController =
      Get.find(tag: 'faceBookSignInController');
  PhoneAuthController phoneAuthController =
      Get.find(tag: 'phoneAuthController');

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PhoneNumber initialCountry = PhoneNumber(isoCode: 'PK');

  var isShowPassword = true.obs;
  var isCheck = false.obs;

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
            child: SingleChildScrollView(
              child: Container(
                width: 100.h,
                margin:
                    EdgeInsets.symmetric(horizontal: 2.8.h, vertical: 3.8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerSpace(2.h),
                        getCustomTextW6S25(
                          text: 'Create an account'.tr,
                          color: accentColor,
                        ),
                        getCustomTextW6S14(
                          text: 'Connect with your friends today!'.tr,
                          color: subTextColor,
                        ),
                        getVerSpace(3.1.h),
                        getCustomTextW6S14(
                          text: 'Full Name'.tr,
                          color: accentColor,
                        ),
                        getVerSpace(0.7.h),
                        getCustomTextFormField(
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          hintText: 'Enter Your Name'.tr,
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name not be empty!".tr;
                            } else {
                              return null;
                            }
                          },
                        ),
                        getVerSpace(1.2.h),
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
                        getVerSpace(1.2.h),
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
                        getVerSpace(4.2.h),
                        GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              phoneAuthController.isSignUp.value = true;
                              phoneAuthController.isAddBankConfirm.value = false;
                              phoneAuthController.isStudentConfirm.value = false;

                              FocusManager.instance.primaryFocus?.unfocus();
                              phoneAuthController.verifyUserPhoneNumber();
                            }
                          },
                          child: fillColorButton(
                              text: 'Sign Up'.tr,
                              loading: phoneAuthController
                                  .loadingVerifyUserPhoneNumber.value),
                        ),
                        getVerSpace(3.2.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Divider(
                                color: borderColor,
                                height: 0.5.px,
                              ),
                            ),
                            getHorSpace(1.9.h),
                            getCustomTextW6S14(
                              text: 'Or With'.tr,
                              color: subTextColor,
                            ),
                            getHorSpace(1.9.h),
                            Expanded(
                              flex: 1,
                              child: Divider(
                                color: borderColor,
                                height: 0.5.px,
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(2.2.h),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  UserCredential? userCredential =
                                      await googleSignInController
                                          .signInWithGoogle();

                                  if (userCredential.toString().isNotEmpty) {
                                    googleSignInController.signOut();
                                    Get.to(() => const GetPhoneNumberScreen());
                                  }
                                },
                                child: googleButton(
                                    googleLogo: 'google_logo.png',
                                    googleText: 'google_text.png'),
                              ),
                            ),
                            getHorSpace(1.3.h),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  faceBookSignInController.signInWithFacebook();
                                },
                                child: facebookButton(
                                  facebookIcon: 'fb_button.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    getVerSpace(5.h),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const LoginScreen());
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'Already have an account ?   '.tr,
                            style: getCustomTextStyleW6S14(
                              color: subTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login'.tr,
                                style: getCustomTextStyleW6S14(
                                  color: accentColor,
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
