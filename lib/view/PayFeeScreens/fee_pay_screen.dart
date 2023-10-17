import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../Widgets/widget_utils.dart';
import 'add_card.dart';
import 'confirm_fee_screen.dart';
import 'select_bank.dart';

class FeePayScreen extends StatefulWidget {
  const FeePayScreen({Key? key}) : super(key: key);

  @override
  State<FeePayScreen> createState() => _FeePayScreenState();
}

class _FeePayScreenState extends State<FeePayScreen> {
  var selectedCard = 0.obs;
  var selectedPaymentMethod = 0.obs;
  var selectedStudent = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
            text: 'Pay Fee'.tr,
            leading: const SizedBox(
              height: 0,
              width: 0,
            )),
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SizedBox(
            width: 100.h,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              elevation: 5,
                              builder: (BuildContext context) {
                                return Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.px),
                                          topRight: Radius.circular(15.px))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.5.h),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            getCustomTextW6S20(
                                                text: 'Select Other Student'.tr,
                                                color: accentColor),
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Icon(
                                                Icons.close,
                                                color: borderColor,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: DataFile
                                              .studentDetailsDataList.length,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.h, horizontal: 2.5.h),
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                selectedStudent.value = index;
                                                Get.back();
                                              },
                                              child: Obx(
                                                () => Container(
                                                  height: 12.h,
                                                  margin: EdgeInsets.only(
                                                      bottom: 1.h),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.h),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        selectedStudent.value ==
                                                                index
                                                            ? backCardColor
                                                            : backgroundColor,
                                                    border: Border.all(
                                                        color: selectedStudent
                                                                    .value ==
                                                                index
                                                            ? backCardColor
                                                            : borderColor,
                                                        width: 1.px),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.px)),
                                                  ),
                                                  child: mainCardForStudent(
                                                    studentName: DataFile
                                                        .studentDetailsDataList[
                                                            index]
                                                        .name,
                                                    studentClass: DataFile
                                                        .studentDetailsDataList[
                                                            index]
                                                        .grade,
                                                    studentInstitute: DataFile
                                                        .studentDetailsDataList[
                                                            index]
                                                        .instituteName,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              getCustomTextW6S14(
                                  text: 'Select Other Student'.tr,
                                  color: skyBlueTextColor),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: skyBlueTextColor,
                              )
                            ],
                          ),
                        )),
                    getVerSpace(1.h),
                    Container(
                        height: 32.h,
                        color: backgroundColor,
                        child: Stack(
                          children: [
                            Container(
                              height: 30.h,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                  color: feePayCardColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.px)),
                                  border:
                                      Border.all(color: borderColor, width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 12.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.h),
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.px)),
                                    ),
                                    child: mainCardForStudent(
                                      studentName: DataFile
                                          .studentDetailsDataList[
                                              selectedStudent.value]
                                          .name,
                                      studentClass: DataFile
                                          .studentDetailsDataList[
                                              selectedStudent.value]
                                          .grade,
                                      studentInstitute: DataFile
                                          .studentDetailsDataList[
                                              selectedStudent.value]
                                          .instituteName,
                                    ),
                                  ),
                                  getVerSpace(1.h),
                                  getCustomTextW6S14(
                                      textAlign: TextAlign.center,
                                      text:
                                          "Fee Payable for the month of\n December 2022"
                                              .tr,
                                      color: accentColor),
                                  getVerSpace(1.h),
                                  getCustomTextW6S36(
                                      text: 'PKR 7,000'.tr, color: accentColor),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 4.h,
                                margin: EdgeInsets.symmetric(horizontal: 8.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: accentColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.px))),
                                child: getCustomTextW6S14(
                                    text: '${'Due Date'.tr} : 10/12/2022',
                                    color: textWhiteColor),
                              ),
                            )
                          ],
                        )),
                    getVerSpace(2.7.h),
                    getCustomTextW6S20(
                        text: 'Choose a payment method'.tr, color: accentColor),
                    getCustomTextW6S14(
                        text:
                            "You won’t be charged until you review the\nnext page"
                                .tr,
                        color: subTextColor),
                    getVerSpace(2.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.px)),
                          border: Border.all(color: borderColor, width: 1)),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 2.h),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: DataFile.backCardDataList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  selectedCard.value = index;
                                },
                                child: Obx(
                                  () => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1.6.h, vertical: 0.8.h),
                                    margin: EdgeInsets.only(bottom: 1.h),
                                    decoration: BoxDecoration(
                                        color: selectedCard.value == index
                                            ? backCardColor
                                            : backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.px)),
                                        border: Border.all(
                                            color: selectedCard.value == index
                                                ? backCardColor
                                                : borderColor,
                                            width: 1)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              getCustomTextW6S14(
                                                  text: DataFile
                                                      .backCardDataList[index]
                                                      .name
                                                      .toString()
                                                      .tr,
                                                  color: textBlackColor),
                                              getVerSpace(0.4),
                                              getCustomTextW6S12(
                                                  text: DataFile
                                                      .backCardDataList[index]
                                                      .numberOfCard
                                                      .toString(),
                                                  color: subTextColor),
                                            ],
                                          ),
                                        ),
                                        selectedCard.value == index
                                            ? Icon(
                                                Icons.check,
                                                color: skyBlueTextColor,
                                                size: 16.px,
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          getVerSpace(2.h),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                elevation: 5,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 38.h,
                                    width: 100.w,
                                    padding: EdgeInsets.only(
                                        right: 3.h,
                                        left: 3.h,
                                        bottom: 4.h,
                                        top: 2.h),
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.px),
                                            topRight: Radius.circular(15.px))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                getCustomTextW6S20(
                                                    text:
                                                        'Add Payment Method'.tr,
                                                    color: accentColor),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: borderColor,
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  paymentMethodList.length,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    selectedPaymentMethod
                                                        .value = index;
                                                  },
                                                  child: Obx(
                                                    () => Container(
                                                      color: backgroundColor,
                                                      margin: EdgeInsets.only(
                                                          bottom: 2.h),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 1.8.h,
                                                                height: 1.8.h,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: selectedPaymentMethod.value ==
                                                                                index
                                                                            ? accentColor
                                                                            : borderColor,
                                                                        width: selectedPaymentMethod.value ==
                                                                                index
                                                                            ? 4.px
                                                                            : 1.5.px)),
                                                              ),
                                                              getHorSpace(2.h),
                                                              getCustomTextW6S16(
                                                                text: paymentMethodList[
                                                                        index]
                                                                    .toString()
                                                                    .tr,
                                                                color:
                                                                    subTextColor,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(() => paymentMethodList[
                                                            selectedPaymentMethod
                                                                .value] ==
                                                        "Credit/Debit Card"
                                                    ? AddCard(
                                                        selectedPaymentMethod:
                                                            paymentMethodList[
                                                                selectedPaymentMethod
                                                                    .value],
                                                      )
                                                    : SelectBankScreen(
                                                        selectedMethod:
                                                            paymentMethodList[
                                                                selectedPaymentMethod
                                                                    .value],
                                                      ));
                                              },
                                              child: fillColorButton(
                                                text: 'Add'.tr,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: getCustomTextW6S14(
                                text: "+ Add new Payment method".tr,
                                color: skyBlueTextColor),
                          ),
                          getVerSpace(1.h),
                        ],
                      ),
                    ),
                    getVerSpace(3.h),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const ConfirmFeeScreen());
                        },
                        child: fillColorButton(text: 'Fee Pay'.tr))
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


