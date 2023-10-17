import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'search_student_screen.dart';

class SearchSchoolScreen extends StatefulWidget {
  const SearchSchoolScreen({Key? key}) : super(key: key);

  @override
  State<SearchSchoolScreen> createState() => _SearchSchoolScreenState();
}

class _SearchSchoolScreenState extends State<SearchSchoolScreen> {
  TextEditingController searchController = TextEditingController();
  var isClosed = true.obs;
  var isSelectSchool = 90000001.obs;
  var searchedList = [].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'Search School'.tr,
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
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getVerSpace(3.h),
                        getCustomTextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          hintText: 'Search schools name...'.tr,
                          controller: searchController,
                          onChanged: (value) {
                            searchedList.clear();
                            isSelectSchool.value = 90000001;
                            if (DataFile.schoolDetailsDataList.isNotEmpty) {
                              for (var element in DataFile.schoolDetailsDataList) {
                                if (element.name!
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
                                            margin: EdgeInsets.only(bottom: 1.h),
                                            decoration: BoxDecoration(
                                                color: isSelectSchool.value == index
                                                    ? backCardColor
                                                    : backgroundColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.px)),
                                                border: Border.all(
                                                    color:
                                                        isSelectSchool.value == index
                                                            ? backCardColor
                                                            : borderColor,
                                                    width: 1)),
                                            child: ListTile(
                                              onTap: () {
                                                isSelectSchool.value = index;
                                              },
                                              leading: Icon(Icons.school_outlined,
                                                  size: 5.h, color: accentColor),
                                              title: getCustomTextW6S14(
                                                  text: searchedList[index]
                                                      .name
                                                      .toString().tr,
                                                  color: textBlackColor),
                                              subtitle: getCustomTextW6S12(
                                                  text: searchedList[index]
                                                      .address
                                                      .toString().tr,
                                                  color: subTextColor),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : getCustomTextW6S14(
                                    textAlign: TextAlign.center,
                                    text: 'School name dos\'t match'.tr,
                                    color: accentColor)
                            : getCustomTextW6S14(
                                textAlign: TextAlign.center,
                                text:
                                    'To add student, please search using\n school name.'.tr,
                                color: accentColor)
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10.h,
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
                  child: InkWell(
                      onTap: () {
                        if (isSelectSchool.value != 90000001) {
                          Get.to(() => SearchStudentScreen(
                            selectedSchool: searchedList[isSelectSchool.value],
                          ));
                          Timer(const Duration(milliseconds: 150), () {
                            searchController.clear();
                            searchedList.clear();
                            isClosed.value = true;
                            isSelectSchool.value = 90000001;
                          });
                        }
                      },
                      child: fillColorButton(text: 'Next'.tr)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
