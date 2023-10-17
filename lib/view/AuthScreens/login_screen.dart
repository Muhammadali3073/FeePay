import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/facebook_sign_in_controller.dart';
import '../../controller/google_sign_in_controller.dart';
import '../../utils/color_data.dart';
import '../BottomNavigationBar/bottom_nav_bar.dart';
import '../Widgets/widget_utils.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var authSuccess = false.obs;
  late LocalAuthentication localAuth;
  var deviceCapable = true.obs;
  final formKey = GlobalKey<FormState>();

  GoogleSignInController googleSignInController =
      Get.find(tag: 'googleSignInController');
  FaceBookSignInController faceBookSignInController =
      Get.find(tag: 'faceBookSignInController');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isShowPassword = true.obs;
  var isCheck = false.obs;
  var isSigningIn = false.obs;

  @override
  void initState() {
    super.initState();
    localAuth = LocalAuthentication();
    checkDevice();
  }

  checkDevice() async {
    bool isBiometricSupported = await localAuth.isDeviceSupported();
    bool isCanCheckBiometrics = await localAuth.canCheckBiometrics;
    if (isCanCheckBiometrics == false && isBiometricSupported == false) {
      deviceCapable.value = false;
    }
  }

  Future<bool> auth() async {
    authSuccess.value = false;
    try {
      final authSuccess = await localAuth.authenticate(
        localizedReason: 'Use your fingerprint to verify your identity',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (mounted) {
        if (authSuccess == true) {
          selectBottomNavigationBarIndex.value = 0;
          Get.offAll(() => const BottomNavScreen());
        } else {
          log('Cancel Fingerprint');
        }
      }
      return authSuccess;
    } catch (e) {
      if (context.mounted) {
        log(e.toString());
      }
      return false;
    }
  }

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
                          text: 'Hi, Welcome Back! 👋'.tr,
                          color: accentColor,
                        ),
                        getCustomTextW6S14(
                          text: 'Hello again, you’ve been missed!'.tr,
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
                        getVerSpace(1.7.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                isCheck.value = !isCheck.value;
                              },
                              child: Row(
                                children: [
                                  isCheck.value
                                      ? getSvgImage(
                                          'check.svg',
                                          height: 2.h,
                                          width: 2.h,
                                        )
                                      : getSvgImage(
                                          'un_check.svg',
                                          height: 2.h,
                                          width: 2.h,
                                        ),
                                  getHorSpace(0.7.h),
                                  getCustomTextW6S14(
                                    text: 'Remember Me'.tr,
                                    color: textBlackColor,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const ForgotPassword());
                              },
                              child: getCustomTextW6S14(
                                text: 'Forgot Password'.tr,
                                color: forgotPasswordColor,
                              ),
                            )
                          ],
                        ),
                        getVerSpace(2.8.h),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              selectBottomNavigationBarIndex.value = 0;
                              Get.offAll(() => const BottomNavScreen());
                            }
                          },
                          child: fillColorButton(text: 'Login'.tr),
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
                              child: InkWell(
                                onTap: () async {
                                  UserCredential? userCredential =
                                      await googleSignInController
                                          .signInWithGoogle();

                                  if (userCredential.toString().isNotEmpty) {
                                    googleSignInController.signOut();
                                    selectBottomNavigationBarIndex.value = 0;
                                    Get.offAll(() => const BottomNavScreen());
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
                    deviceCapable.value
                        ? Column(
                            children: [
                              getVerSpace(5.h),
                              IconButton(
                                onPressed: () async {
                                  if (emailController.text.isNotEmpty &&
                                      passwordController.text.isNotEmpty) {
                                    final authSuccess = await auth();
                                    this.authSuccess.value = authSuccess;
                                  } else {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (_) {
                                          return AlertDialog(
                                              backgroundColor: backgroundColor,
                                              elevation: 0,
                                              content: SizedBox(
                                                height: 15.h,
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .fingerprint_outlined,
                                                            color: accentColor,
                                                            size: 6.h),
                                                        getVerSpace(1.h),
                                                        getCustomTextW6S14(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text:
                                                                'Kindly login / register for enabling authentication',
                                                            color:
                                                                textBlackColor),
                                                      ],
                                                    ),
                                                    Positioned(
                                                      right: 3,
                                                      top: 4,
                                                      child: InkWell(
                                                          onTap: () =>
                                                              Get.back(),
                                                          child: Icon(
                                                            Icons.close,
                                                            color: accentColor,
                                                            size: 3.h,
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                        });
                                  }
                                },
                                icon: Icon(Icons.fingerprint_outlined,
                                    color: accentColor, size: 5.5.h),
                              ),
                            ],
                          )
                        : Container(),
                    getVerSpace(5.h),
                    GestureDetector(
                      onTap: () {
                        Get.off(() => const SignUpScreen());
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'Don’t have an account ?   '.tr,
                            style: getCustomTextStyleW6S14(
                              color: subTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up'.tr,
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
