
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';
import 'card_account_screen.dart';

//ignore: must_be_immutable
class DeleteCardScreen extends StatefulWidget {
  DeleteCardScreen({Key? key, this.index}) : super(key: key);
  dynamic index;

  @override
  State<DeleteCardScreen> createState() => _DeleteCardScreenState();
}

class _DeleteCardScreenState extends State<DeleteCardScreen> {
  var switchValue = true.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (primaryIndex.value == widget.index) {
      switchValue.value = true;
    } else {
      switchValue.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'Card/Account Details'.tr,
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
            child: SizedBox(
          width: 100.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.6.h, vertical: 0.8.h),
                  margin: EdgeInsets.only(bottom: 1.h),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.px)),
                      border: Border.all(color: borderColor, width: 1)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getCustomTextW6S12(
                                  text: DataFile
                                      .backCardDataList[widget.index].name
                                      .toString()
                                      .tr,
                                  color: subTextColor),
                              getVerSpace(0.4),
                              getCustomTextW6S12(
                                  text: DataFile.backCardDataList[widget.index]
                                      .numberOfCard
                                      .toString(),
                                  color: textBlackColor),
                            ],
                          ),
                        ],
                      ),
                      primaryIndex.value == widget.index
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.h, vertical: 0.5.h),
                              decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.px))),
                              child: getCustomTextW6S9(
                                  text: 'Primary'.tr, color: textWhiteColor),
                            )
                          : Container()
                    ],
                  ),
                ),
                getVerSpace(2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomTextW6S12(
                                    text: 'Select a new primary payment method'
                                        .tr,
                                    color: textBlackColor),
                                getVerSpace(0.4),
                                getCustomTextW6S12(
                                    text:
                                        'We will use this payment method for all your orders'
                                            .tr,
                                    color: subTextColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FlutterSwitch(
                      height: 20.0,
                      width: 35.0,
                      padding: 2.0,
                      toggleSize: 12.0,
                      borderRadius: 10.0,
                      inactiveColor: borderColor,
                      activeColor: accentColor,
                      value: switchValue.value,
                      onToggle: (value) {
                        switchValue.value = value;
                      },
                    ),
                  ],
                ),
                getVerSpace(2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getCustomTextW6S12(
                                    text: 'Remove card/account'.tr,
                                    color: textBlackColor),
                                getVerSpace(0.4),
                                getCustomTextW6S12(
                                    text:
                                        'We will use this payment method out from the list'
                                            .tr,
                                    color: subTextColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDeleteDialog();
                      },
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: accentColor,
                        size: 3.5.h,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<void> showDeleteDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 0,
            title: getCustomTextW6S16(
                textAlign: TextAlign.start,
                text: 'Remove This Payment Method'.tr,
                color: accentColor),
            children: <Widget>[
              SimpleDialogOption(
                child: getCustomTextW6S14(
                    text:
                        'We will remove it from your list of\npayment method saved.'
                            .tr,
                    color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: fillColorButton(text: 'Remove Payment Method'.tr),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: outlineColorButton(text: 'Keep Payment Method'.tr),
              ),
            ],
          );
        });
  }
}
