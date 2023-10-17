import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';
import 'add_bank.dart';

//ignore: must_be_immutable
class SelectBankScreen extends StatefulWidget {
  SelectBankScreen({Key? key, this.selectedMethod}) : super(key: key);
  dynamic selectedMethod;

  @override
  State<SelectBankScreen> createState() => _SelectBankScreenState();
}

class _SelectBankScreenState extends State<SelectBankScreen> {
  TextEditingController searchController = TextEditingController();
  var isClosed = true.obs;
  var searchedList = [].obs;

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
          appBar: getAppBar(
            text: widget.selectedMethod.toString().tr,
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
                padding: EdgeInsets.symmetric(horizontal: 2.8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getVerSpace(3.h),
                    getCustomTextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: 'Search (e.g. bank name)...'.tr,
                      controller: searchController,
                      onChanged: (value) {
                        searchedList.clear();
                        if (DataFile.bankMethodModel.isNotEmpty) {
                          for (var element in DataFile.bankMethodModel) {
                            if (element.nameBank!
                                .toLowerCase()
                                .contains(searchController.text)) {
                              searchedList.add(element);
                            }
                          }
                        }

                        if (searchController.text.isNotEmpty) {
                          isClosed.value = false;
                        } else {
                          isClosed.value = true;
                        }
                      },
                      prefixIcon: Icon(
                        Icons.search,
                        color: accentColor,
                        size: 30.px,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            searchController.clear();
                            searchedList.clear();
                            isClosed.value = true;
                          },
                          child: isClosed.value == true
                              ? Container()
                              : Icon(
                                  Icons.cancel,
                                  color: feePayCardColor,
                                  size: 20.px,
                                )),
                    ),
                    getVerSpace(3.h),
                    Expanded(
                      child: searchController.text.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: searchedList.length,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      Get.to(() => AddBankScreen(
                                            selectedBank: searchedList[index]
                                                .nameBank
                                                .toString(),
                                            selectedPaymentMethod:
                                                widget.selectedMethod,
                                          ));
                                      Timer(const Duration(milliseconds: 150),
                                          () {
                                        searchController.clear();
                                        searchedList.clear();
                                        isClosed.value = true;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 1.5.h),
                                      decoration: BoxDecoration(
                                          color: backgroundColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.px)),
                                          border: Border.all(
                                              color: borderColor, width: 1)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 2.h),
                                            leading: CircleAvatar(
                                                radius: 2.5.h,
                                                backgroundColor: borderColor),
                                            title: getCustomTextW6S14(
                                                text: searchedList[index]
                                                    .nameBank
                                                    .toString().tr,
                                                color: textBlackColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: DataFile.bankMethodModel.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => AddBankScreen(
                                          selectedBank: DataFile
                                              .bankMethodModel[index].nameBank
                                              .toString(),
                                          selectedPaymentMethod: widget.selectedMethod,
                                        ));
                                    Timer(const Duration(milliseconds: 150),
                                        () {
                                      searchController.clear();
                                      searchedList.clear();
                                      isClosed.value = true;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 1.5.h),
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.px)),
                                        border: Border.all(
                                            color: borderColor, width: 1)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 2.h),
                                          leading: CircleAvatar(
                                              radius: 2.5.h,
                                              backgroundColor: borderColor),
                                          title: getCustomTextW6S14(
                                              text: DataFile
                                                  .bankMethodModel[index]
                                                  .nameBank
                                                  .toString().tr,
                                              color: textBlackColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
