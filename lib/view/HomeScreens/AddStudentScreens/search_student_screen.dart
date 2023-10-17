import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'confirm_student_screen.dart';

//ignore: must_be_immutable
class SearchStudentScreen extends StatefulWidget {
  SearchStudentScreen({Key? key, this.selectedSchool}) : super(key: key);
  dynamic selectedSchool;

  @override
  State<SearchStudentScreen> createState() => _SearchStudentScreenState();
}

class _SearchStudentScreenState extends State<SearchStudentScreen> {
  TextEditingController searchController = TextEditingController();
  var isClosed = true.obs;
  var searchedList = [].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'Search Student'.tr,
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
        // bottomNavigationBar: Container(
        //   height: 8.h,
        //   padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 1.h),
        //   child: fillColorButton(text: 'Add'),
        // ),
        body: SafeArea(
          child: SizedBox(
            width: 100.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getVerSpace(3.h),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.h),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.px)),
                        border: Border.all(color: borderColor, width: 1)),
                    child: ListTile(
                      leading: Icon(Icons.school_outlined,
                          size: 5.h, color: accentColor),
                      title: getCustomTextW6S14(
                          text: widget.selectedSchool.name.toString().tr,
                          color: textBlackColor),
                      subtitle: getCustomTextW6S12(
                          text: widget.selectedSchool.address.toString().tr,
                          color: subTextColor),
                    ),
                  ),
                  getVerSpace(1.h),
                  getCustomTextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    hintText: 'Search Student ID, Name...'.tr,
                    controller: searchController,
                    onChanged: (value) {
                      searchedList.clear();
                      if (DataFile.studentDetailsDataList.isNotEmpty) {
                        for (var element in DataFile.studentDetailsDataList) {
                          if (element.name!
                                  .toLowerCase()
                                  .contains(searchController.text) ||
                              element.studentID!
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
                  searchController.text.isNotEmpty
                      ? searchedList.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: searchedList.length,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => Container(
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
                                                    vertical: 1.h,
                                                    horizontal: 2.h),
                                            leading: Icon(
                                                Icons.person_2_rounded,
                                                size: 5.h,
                                                color: accentColor),
                                            title: getCustomTextW6S14(
                                                text: searchedList[index]
                                                    .name
                                                    .toString()
                                                    .tr,
                                                color: textBlackColor),
                                            subtitle: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                getCustomTextW6S12(
                                                    text:
                                                        '${'Student ID'.tr}: ${searchedList[index].studentID.toString()}',
                                                    color: subTextColor),
                                                getCustomTextW6S12(
                                                    text:
                                                        '${'Class'.tr}: ${searchedList[index].grade.toString()}',
                                                    color: subTextColor),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Get.to(() =>
                                                    ConfirmStudentScreen(
                                                      selectedStudent:
                                                          searchedList[index],
                                                    ));
                                                Timer(
                                                    const Duration(
                                                        milliseconds: 150), () {
                                                  searchController.clear();
                                                  searchedList.clear();
                                                  isClosed.value = true;
                                                });
                                              },
                                              child:
                                                  fillColorButton(text: 'Add'.tr)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : getCustomTextW6S14(
                              text: 'Student Id or Name dos\'t match'.tr,
                              color: accentColor,
                              textAlign: TextAlign.center)
                      : getCustomTextW6S14(
                          text:
                              'You can search student by\n Student ID and Name.'.tr,
                          color: accentColor,
                          textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
