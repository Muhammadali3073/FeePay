import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/phone_auth_controller.dart';
import '../../utils/color_data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class AddBankScreen extends StatefulWidget {
  AddBankScreen({Key? key, this.selectedPaymentMethod, this.selectedBank})
      : super(key: key);
  dynamic selectedPaymentMethod;
  dynamic selectedBank;

  @override
  State<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  PhoneAuthController phoneAuthController =
      Get.find(tag: 'phoneAuthController');
  TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: widget.selectedPaymentMethod.toString().tr,
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
            width: 100.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(3.h),
                  Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.px)),
                        border: Border.all(color: borderColor, width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                          leading: CircleAvatar(
                              radius: 2.5.h, backgroundColor: borderColor),
                          title: getCustomTextW6S14(
                              text: widget.selectedBank.toString().tr,
                              color: textBlackColor),
                        ),
                      ],
                    ),
                  ),
                  getVerSpace(2.5.h),
                  getCustomTextW6S14(
                      text: widget.selectedPaymentMethod == 'E-Wallet'.tr
                          ? 'Account Number'.tr
                          : 'Account Number/IBAN'.tr,
                      color: accentColor),
                  getVerSpace(1.h),
                  getCustomTextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: widget.selectedPaymentMethod == 'E-Wallet'.tr
                        ? 'Account Number'.tr
                        : 'Account Number/IBAN'.tr,
                    controller: accountNumberController,
                    onChanged: (value) {},
                  ),
                  getVerSpace(0.5.h),
                  getCustomTextW6S10(
                      text: widget.selectedPaymentMethod == 'E-Wallet'.tr
                          ? '${'Please enter'.tr} ${widget.selectedBank.toString().tr} ${'11 digit account number'.tr}'
                          : '${'Please enter'.tr} ${widget.selectedBank.toString().tr} ${'11 digit account number'.tr}',
                      color: subTextColor),
                  getVerSpace(5.h),
                  GestureDetector(
                      onTap: () {
                        phoneAuthController.isAddBankConfirm.value = true;
                        phoneAuthController.isSignUp.value = false;
                        phoneAuthController.isStudentConfirm.value = false;
                        phoneAuthController.selectedPaymentMethod.value =
                            widget.selectedPaymentMethod;
                        phoneAuthController.phoneNumber.value =
                            phoneAuthController.phoneNumberFromSharePref.value;
                        phoneAuthController.verifyUserPhoneNumber();
                      },
                      child: fillColorButton(
                          text: 'Add'.tr,
                          loading: phoneAuthController
                              .loadingVerifyUserPhoneNumber.value)),
                  getVerSpace(1.5.h),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.back();
                        Get.back();
                      },
                      child: outlineColorButton(text: 'Cancel'.tr))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
