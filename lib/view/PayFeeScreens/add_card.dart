import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/phone_auth_controller.dart';
import '../../utils/color_data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class AddCard extends StatefulWidget {
  AddCard({Key? key, this.selectedPaymentMethod}) : super(key: key);
  dynamic selectedPaymentMethod;

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  PhoneAuthController phoneAuthController =
      Get.find(tag: 'phoneAuthController');

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateNumberController = TextEditingController();
  TextEditingController ccvNumberController = TextEditingController();
  TextEditingController nameNumberController = TextEditingController();

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: getAppBar(
            text: widget.selectedPaymentMethod.toString().tr,
            leading: language.value != 'English'
                ? Container()
                : IconButton(
                    icon: getAssetImage('back_arrow.png', scale: 5),
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                  ),
            actions: language.value == 'English'
                ? Container()
                : IconButton(
                    icon: getAssetImage('back_arrow.png', scale: 5),
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                  ),
          ),
          body: SafeArea(
            child: SizedBox(
              width: 100.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.8.h, vertical: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomTextW6S14(
                            text: 'Card Number'.tr, color: accentColor),
                        getVerSpace(1.h),
                        getCustomTextFormField(
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          hintText: 'Enter 16 digit card no'.tr,
                          controller: cardNumberController,
                          onChanged: (value) {},
                        ),
                        getVerSpace(2.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S14(
                                      text: 'Expiry Date'.tr,
                                      color: accentColor),
                                  getVerSpace(1.h),
                                  getCustomTextFormField(
                                    keyboardType: TextInputType.phone,
                                    obscureText: false,
                                    hintText: '00/00',
                                    controller: dateNumberController,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                            getHorSpace(1.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S14(
                                      text: 'CCV'.tr, color: accentColor),
                                  getVerSpace(1.h),
                                  getCustomTextFormField(
                                    keyboardType: TextInputType.phone,
                                    obscureText: false,
                                    hintText: '000',
                                    controller: ccvNumberController,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(2.h),
                        getCustomTextW6S14(
                            text: 'Client'.tr, color: accentColor),
                        getVerSpace(1.h),
                        getCustomTextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          hintText: 'Enter Your Name'.tr,
                          controller: nameNumberController,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              phoneAuthController.isAddBankConfirm.value = true;
                              phoneAuthController.isSignUp.value = false;
                              phoneAuthController.isStudentConfirm.value =
                                  false;
                              phoneAuthController.selectedPaymentMethod.value =
                                  widget.selectedPaymentMethod;
                              phoneAuthController.phoneNumber.value =
                                  phoneAuthController
                                      .phoneNumberFromSharePref.value;
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
                            },
                            child: outlineColorButton(text: 'Cancel'.tr))
                      ],
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
