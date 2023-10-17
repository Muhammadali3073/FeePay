import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../PayFeeScreens/add_card.dart';
import '../PayFeeScreens/select_bank.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';
import 'delete_card_screen.dart';

var primaryIndex = 0.obs;

class CardAccountScreen extends StatefulWidget {
  const CardAccountScreen({Key? key}) : super(key: key);

  @override
  State<CardAccountScreen> createState() => _CardAccountScreenState();
}

class _CardAccountScreenState extends State<CardAccountScreen> {
  var selectedPaymentMethod = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        text: 'Card and Account'.tr,
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
      bottomNavigationBar: Container(
        height: 10.h,
        padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
        child: InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                elevation: 5,
                builder: (BuildContext context) {
                  return Container(
                    height: 38.h,
                    width: 100.w,
                    padding: EdgeInsets.only(
                        right: 3.h, left: 3.h, bottom: 4.h, top: 2.h),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.px),
                            topRight: Radius.circular(15.px))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S20(
                                    text: 'Add Payment Method'.tr,
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
                              itemCount: paymentMethodList.length,
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    selectedPaymentMethod.value = index;
                                  },
                                  child: Obx(
                                    () => Container(
                                      color: backgroundColor,
                                      margin: EdgeInsets.only(bottom: 2.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 1.8.h,
                                            height: 1.8.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: selectedPaymentMethod
                                                                .value ==
                                                            index
                                                        ? accentColor
                                                        : borderColor,
                                                    width: selectedPaymentMethod
                                                                .value ==
                                                            index
                                                        ? 4.px
                                                        : 1.5.px)),
                                          ),
                                          getHorSpace(2.h),
                                          getCustomTextW6S16(
                                            text: paymentMethodList[index].toString().tr,
                                            color: subTextColor,
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
                                            selectedPaymentMethod.value] ==
                                        "Credit/Debit Card"
                                    ? AddCard(
                                        selectedPaymentMethod: paymentMethodList[
                                            selectedPaymentMethod.value],
                                      )
                                    : SelectBankScreen(
                                        selectedMethod: paymentMethodList[
                                            selectedPaymentMethod.value],
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
            child: fillColorButton(text: 'Add New'.tr)),
      ),
      body: SafeArea(
          child: DataFile.backCardDataList.isNotEmpty
              ? SingleChildScrollView(
                  child: SizedBox(
                    width: 100.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.5.h, vertical: 2.7.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomTextW6S16(
                              text: 'Saved Payment Methods'.tr,
                              color: accentColor),
                          getVerSpace(2.h),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: DataFile.backCardDataList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DeleteCardScreen(index: index,));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.6.h, vertical: 0.8.h),
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.px)),
                                      border: Border.all(
                                          color: borderColor, width: 1)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.credit_card_rounded,
                                            color: borderColor,
                                            size: 3.h,
                                          ),
                                          getHorSpace(1.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              getCustomTextW6S12(
                                                  text: DataFile
                                                      .backCardDataList[index]
                                                      .name
                                                      .toString().tr,
                                                  color: subTextColor),
                                              getVerSpace(0.4),
                                              getCustomTextW6S12(
                                                  text: DataFile
                                                      .backCardDataList[index]
                                                      .numberOfCard
                                                      .toString(),
                                                  color: textBlackColor),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          primaryIndex.value ==
                                                  index
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.h,
                                                      vertical: 0.5.h),
                                                  decoration: BoxDecoration(
                                                      color: accentColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4.px))),
                                                  child: getCustomTextW6S9(
                                                      text: 'Primary'.tr,
                                                      color: textWhiteColor),
                                                )
                                              : Container(),
                                          getHorSpace(2.h),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: skyBlueTextColor,
                                            size: 2.h,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.credit_card_rounded,
                        color: borderColor,
                        size: 12.h,
                      ),
                      getCustomTextW6S14(
                          text: 'No card and account found',
                          color: textBlackColor),
                      getCustomTextW6S14(
                          text:
                              'You haven\'t add any card and account yet,\nOtherwise your card and account\nwill appear here.',
                          color: subTextColor,
                          textAlign: TextAlign.center)
                    ],
                  ),
                )),
    );
  }
}
