import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/phone_auth_controller.dart';
import '../../../utils/color_data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class ConfirmStudentScreen extends StatefulWidget {
  ConfirmStudentScreen({Key? key, this.selectedStudent}) : super(key: key);
  dynamic selectedStudent;

  @override
  State<ConfirmStudentScreen> createState() => _ConfirmStudentScreenState();
}

class _ConfirmStudentScreenState extends State<ConfirmStudentScreen> {
  PhoneAuthController phoneAuthController =
      Get.find(tag: 'phoneAuthController');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: getAppBar(
          text: 'Confirm Student'.tr,
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
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.8.h, vertical: 2.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: feePayCardColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.px))),
                      ),
                      getVerSpace(2.5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 3.2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomTextW6S14(
                                    text: '${'Student Name'.tr}:',
                                    color: subTextColor),
                                getVerSpace(0.4.h),
                                getCustomTextW6S14(
                                    text: '${'Class'.tr}:',
                                    color: subTextColor),
                                getVerSpace(0.4.h),
                                getCustomTextW6S14(
                                    text: '${'Institute Name'.tr}:',
                                    color: subTextColor),
                                getVerSpace(0.4.h),
                                getCustomTextW6S14(
                                    text: '${'Student ID'.tr}:',
                                    color: subTextColor),
                                getVerSpace(0.4.h),
                                getCustomTextW6S14(
                                    text: '${'Date of Birth'.tr}:',
                                    color: subTextColor),
                              ],
                            ),
                            getHorSpace(1.4.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S14(
                                      text: widget.selectedStudent.name
                                          .toString()
                                          .tr,
                                      color: accentColor,
                                      maxLines: 1),
                                  getVerSpace(0.4.h),
                                  getCustomTextW6S14(
                                      text: widget.selectedStudent.grade
                                          .toString(),
                                      color: accentColor,
                                      maxLines: 1),
                                  getVerSpace(0.4.h),
                                  getCustomTextW6S14(
                                      text: widget.selectedStudent.instituteName
                                          .toString()
                                          .tr,
                                      color: accentColor,
                                      maxLines: 1),
                                  getVerSpace(0.4.h),
                                  getCustomTextW6S14(
                                      text: widget.selectedStudent.studentID
                                          .toString(),
                                      color: accentColor,
                                      maxLines: 1),
                                  getVerSpace(0.4.h),
                                  getCustomTextW6S14(
                                      text: widget.selectedStudent.dateOfBirth
                                          .toString()
                                          .tr,
                                      color: accentColor,
                                      maxLines: 1),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            phoneAuthController.isStudentConfirm.value = true;
                            phoneAuthController.isAddBankConfirm.value = false;
                            phoneAuthController.isSignUp.value = false;

                            phoneAuthController.phoneNumber.value =
                                phoneAuthController
                                    .phoneNumberFromSharePref.value;
                            phoneAuthController.verifyUserPhoneNumber();
                          },
                          child: fillColorButton(
                              text: 'Confirm'.tr,
                              loading: phoneAuthController
                                  .loadingVerifyUserPhoneNumber.value)),
                      getVerSpace(2.h),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: outlineColorButton(text: 'Back'.tr))
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
