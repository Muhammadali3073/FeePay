import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../PayFeeScreens/add_card.dart';
import '../../PayFeeScreens/select_bank.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'congratulations_transfer_to_bank_e_wallet.dart';
import 'withdraw_crypto_screen.dart';

class WalletMainScreen extends StatefulWidget {
  const WalletMainScreen({Key? key}) : super(key: key);

  @override
  State<WalletMainScreen> createState() => _WalletMainScreenState();
}

class _WalletMainScreenState extends State<WalletMainScreen> {
  var switchValue = true.obs;
  var selectedAccount = 0.obs;
  var selectedPaymentMethod = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        text: 'Wallet'.tr,
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.5.h),
        width: 100.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          getVerSpace(3.h),
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                getCustomTextW6S14(
                    text: 'Coins'.tr,
                    color: switchValue.value == false
                        ? skyBlueTextColor
                        : subTextColor),
                getHorSpace(0.5.h),
                FlutterSwitch(
                  height: 17.0,
                  width: 30.0,
                  padding: 2.0,
                  toggleSize: 12.0,
                  borderRadius: 10.0,
                  inactiveColor: skyBlueTextColor,
                  activeColor: accentColor,
                  value: switchValue.value,
                  onToggle: (value) {
                    switchValue.value = value;
                    selectedAccount.value = 0;
                  },
                ),
                getHorSpace(0.5.h),
                getCustomTextW6S14(
                    text: 'Cash'.tr,
                    color:
                        switchValue.value == true ? accentColor : subTextColor),
              ],
            ),
          ),
          getVerSpace(1.6.h),
          Obx(
            () => Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.px)),
                  border: Border.all(color: accentColor, width: 1.px)),
              child: Column(children: [
                getAssetImage(
                    switchValue.value != true
                        ? 'coin_icon.png'
                        : 'currency_exchange.png',
                    scale: 4),
                getVerSpace(0.5.h),
                getCustomTextW6S14(
                    text: 'You currently have'.tr,
                    color: switchValue.value != true
                        ? skyBlueTextColor
                        : accentColor),
                getCustomTextW6S36(
                    text: switchValue.value != true
                        ? '100 Coins'.tr
                        : 'PKR 7,000'.tr,
                    color: switchValue.value != true
                        ? skyBlueTextColor
                        : accentColor),
                switchValue.value == true
                    ? const Text('')
                    : getCustomTextW6S16(
                        text: '= PKR 1,000'.tr, color: accentColor),
              ]),
            ),
          ),
          getVerSpace(2.5.h),
          GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  elevation: 5,
                  builder: (BuildContext context) {
                    return Container(
                      height: 23.5.h,
                      width: 100.w,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.px),
                              topRight: Radius.circular(15.px))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomTextW6S20(
                                  text: 'Link Account'.tr, color: accentColor),
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
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => SelectBankScreen(
                                        selectedMethod: 'Bank Account',
                                      ));
                                },
                                child: fillColorButton(
                                  text: 'Bank Account'.tr,
                                ),
                              ),
                              getVerSpace(1.4.h),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => SelectBankScreen(
                                          selectedMethod: 'E-Wallet',
                                        ));
                                  },
                                  child:
                                      outlineColorButton(text: 'E-Wallet'.tr)),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: fillColorButton(text: 'Link Account'.tr)),
          getVerSpace(1.5.h),
          GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  elevation: 5,
                  builder: (BuildContext context) {
                    return Container(
                      height: 45.h,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  getCustomTextW6S20(
                                      text: switchValue.value == true
                                          ? 'Transfer to Bank/E-Wallet'.tr
                                          : 'Withdraw'.tr,
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
                              SizedBox(
                                height: 21.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  itemCount: switchValue.value == true
                                      ? withDrawTransferTitle.length
                                      : withDrawTitle.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        selectedAccount.value = index;
                                      },
                                      child: Obx(
                                        () => Container(
                                          color: backgroundColor,
                                          margin:
                                              EdgeInsets.only(bottom: 1.1.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
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
                                                            color: selectedAccount
                                                                        .value ==
                                                                    index
                                                                ? accentColor
                                                                : borderColor,
                                                            width: selectedAccount
                                                                        .value ==
                                                                    index
                                                                ? 4.px
                                                                : 1.5.px)),
                                                  ),
                                                  getHorSpace(2.h),
                                                  getCustomTextW6S16(
                                                    text: switchValue.value ==
                                                            true
                                                        ? withDrawTransferTitle[
                                                                index]
                                                            .toString()
                                                            .tr
                                                        : withDrawTitle[index]
                                                            .toString()
                                                            .tr,
                                                    color: subTextColor,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 1.8.h,
                                                    height: 1.8.h,
                                                  ),
                                                  getHorSpace(2.h),
                                                  getCustomTextW6S14(
                                                    text: switchValue.value ==
                                                            true
                                                        ? withDrawTransferSubTitle[
                                                            index]
                                                        : withDrawSubTitle[
                                                                index]
                                                            .toString()
                                                            .tr,
                                                    color: subTextColor,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  switchValue.value == true
                                      ? Get.offAll(() =>
                                          CongratulationTransferBankEWalletScreen(
                                            accountName: withDrawTransferTitle[
                                                selectedAccount.value],
                                          ))
                                      : Get.to(() => const WithdrawCrypto());
                                },
                                child: fillColorButton(
                                  text: 'Transfer'.tr,
                                ),
                              ),
                              getVerSpace(1.4.h),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
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
                                                  topLeft:
                                                      Radius.circular(15.px),
                                                  topRight:
                                                      Radius.circular(15.px))),
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      getCustomTextW6S20(
                                                          text:
                                                              'Add Payment Method'
                                                                  .tr,
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
                                                    itemCount: paymentMethodList
                                                        .length,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          selectedPaymentMethod
                                                              .value = index;
                                                        },
                                                        child: Obx(
                                                          () => Container(
                                                            color:
                                                                backgroundColor,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        2.h),
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
                                                                      width:
                                                                          1.8.h,
                                                                      height:
                                                                          1.8.h,
                                                                      decoration: BoxDecoration(
                                                                          shape: BoxShape
                                                                              .circle,
                                                                          border: Border.all(
                                                                              color: selectedPaymentMethod.value == index ? accentColor : borderColor,
                                                                              width: selectedPaymentMethod.value == index ? 4.px : 1.5.px)),
                                                                    ),
                                                                    getHorSpace(
                                                                        2.h),
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
                                  child:
                                      outlineColorButton(text: 'Add New'.tr)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: outlineColorButton(text: 'Withdrawal Money'.tr)),
        ]),
      ),
    );
  }
}


