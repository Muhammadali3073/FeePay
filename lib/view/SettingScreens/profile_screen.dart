import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? genderController;
  String? dOBController;

  var gender = 'Not added'.obs;
  var dOB = 'Not added'.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'Profile'.tr,
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
                        text: 'Personal Information'.tr, color: accentColor),
                    getVerSpace(1.h),
                    settingFirstCard(
                      arrowColor: backgroundColor,
                      icon: 'personal_info.png',
                      title: 'Full Name'.tr,
                      subTitle: 'Abdul Waheed'.tr,
                    ),
                    getVerSpace(1.4.h),
                    settingFirstCard(
                      arrowColor: backgroundColor,
                      icon: 'personal_info.png',
                      title: 'Phone Number'.tr,
                      subTitle: '+9233127666',
                    ),
                    getVerSpace(1.4.h),
                    settingCard(
                      arrowColor: backgroundColor,
                      icon: 'personal_info.png',
                      title: 'What\'s Your Email?'.tr,
                    ),
                    getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=>const ChangePasswordScreen());
                      },
                      child: settingCard(
                        icon: 'personal_info.png',
                        title: 'Change Password'.tr,
                      ),
                    ),
                    getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          elevation: 5,
                          builder: (BuildContext context) {
                            return Container(
                              width: 100.w,
                              height: 25.h,
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.px),
                                      topRight: Radius.circular(15.px))),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: DataFile.genderList.length,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.h, vertical: 2.h),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                        gender.value = DataFile
                                            .genderList[index].name
                                            .toString();
                                        genderController = DataFile
                                            .genderList[index].name
                                            .toString();
                                      },
                                      child: outlineColorButton(
                                          text: DataFile.genderList[index].name
                                              .toString()),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: settingFirstCard(
                          icon: 'personal_info.png',
                          title: 'Gender'.tr,
                          subTitle: genderController.toString().isNotEmpty
                              ? gender.value
                              : genderController.toString().tr,
                          settingIcon: Icons.edit_outlined,
                          settingSize: 2.5.h),
                    ),
                    getVerSpace(1.4.h),
                    GestureDetector(
                      onTap: () async {
                        await showCupertinoModalPopup<void>(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return Container(
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.px),
                                  topRight: Radius.circular(12.px),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                            dOB.value =
                                                dOBController.toString() ==
                                                        'null'
                                                    ? 'Not added'
                                                    : dOBController.toString();
                                          },
                                          child: getCustomTextW6S16(
                                              text: 'Cancel',
                                              color: textBlackColor),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                            dOBController = dOB.value;
                                          },
                                          child: getCustomTextW6S16(
                                              text: 'Done',
                                              color: textBlackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (value) {
                                        dOB.value =
                                            value.toString().substring(0, 10);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: settingFirstCard(
                          icon: 'personal_info.png',
                          title: 'Date of Birth'.tr,
                          subTitle: dOBController.toString().isNotEmpty
                              ? dOB.value
                              : dOBController.toString(),
                          settingIcon: Icons.edit_outlined,
                          settingSize: 2.5.h),
                    ),
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
