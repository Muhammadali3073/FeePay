import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/google_sign_in_controller.dart';
import '../../utils/color_data.dart';
import '../AuthScreens/login_screen.dart';
import 'WalletScreens/wallet_main_screen.dart';
import 'notification_screen.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';
import 'card_account_screen.dart';
import 'profile_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  GoogleSignInController googleSignInController =
      Get.find(tag: 'googleSignInController');
  var isSigningOut = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
            text: 'Setting'.tr,
            leading: const SizedBox(
              height: 0,
              width: 0,
            )),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 100.h,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.7.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomTextW6S16(
                        text: 'Your Account'.tr, color: accentColor),
                    getVerSpace(1.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ProfileScreen());
                      },
                      child: settingFirstCard(
                        icon: 'personal_info.png',
                        title: 'Personal Information'.tr,
                        subTitle: 'Abdul Waheed'.tr,
                      ),
                    ),
                    getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const WalletMainScreen());
                      },
                      child: settingCard(
                        icon: 'wallet.png',
                        title: 'Wallet'.tr,
                        scale: 5.0
                      ),
                    ),getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CardAccountScreen());
                      },
                      child: settingCard(
                        icon: 'card_account.png',
                        title: 'Card and Account'.tr,
                      ),
                    ),
                    getVerSpace(1.4.h),
                    settingCard(
                      icon: 'location_icon.png',
                      title: 'Places and Addresses'.tr,
                    ),
                    getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const NotificationScreen());
                      },
                      child: settingCard(
                        icon: 'notification_icon.png',
                        title: 'Notifications'.tr,
                      ),
                    ),
                    getVerSpace(1.h),
                    getCustomTextW6S14(text: 'Benefits'.tr, color: accentColor),
                    getVerSpace(1.4.h),
                    settingFirstCard(
                      icon: 'reword_icon.png',
                      title: 'Rewards'.tr,
                      subTitle: 'You have 560 points'.tr,
                    ),
                    getVerSpace(1.h),
                    getCustomTextW6S14(text: 'Support'.tr, color: accentColor),
                    getVerSpace(1.4.h),
                    settingCard(
                      icon: 'help_icon.png',
                      title: 'Help'.tr,
                    ),
                    getVerSpace(1.4.h),
                    settingCard(
                      icon: 'star_icon.png',
                      title: 'Rate the app'.tr,
                    ),
                    getVerSpace(1.h),
                    getCustomTextW6S14(
                        text: 'Preferences'.tr, color: accentColor),
                    getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () {
                        showLanguageDialog();
                      },
                      child: settingFirstCard(
                        icon: 'language_icon.png',
                        title: 'Language'.tr,
                        subTitle:
                            language.value == 'English' ? 'English' : 'Urdu'.tr,
                      ),
                    ),
                    getVerSpace(1.5.h),
                    isSigningOut.value
                        ? SizedBox(
                            height: 4.h,
                            width: 100.w,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: accentColor,
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              isSigningOut.value = true;
                              await googleSignInController.signOut();
                              isSigningOut.value = false;
                              Get.to(() => const LoginScreen());
                            },
                            child: signOutButton())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showLanguageDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 0,
            title: getCustomTextW6S20(
                text: 'Select Language'.tr, color: accentColor),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  language.value = 'English';
                  Get.updateLocale(const Locale('en', 'US'));
                  Get.back();
                },
                child: getCustomTextW6S14(
                    text: 'English'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  language.value = 'Urdu';
                  Get.updateLocale(const Locale('ur', 'PK'));
                  Get.back();
                },
                child:
                    getCustomTextW6S14(text: 'Urdu'.tr, color: textBlackColor),
              ),
            ],
          );
        });
  }
}
