import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({Key? key}) : super(key: key);

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(
        text: 'Classes'.tr,
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
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.h),
                child: getCustomTextW6S16(text: 'Time Table of Classes:'.tr),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    margin: EdgeInsets.only(left: 2.5.h, right: 2.5.h),
                    child: DataTable(
                        dataRowHeight: 10.h,
                        border: TableBorder.all(),
                        columns: [
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: '', color: textBlackColor),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '0', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '7:55 - 8:20', color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '1', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '8:20 - 8:55', color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '2', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '8:55 - 9:30', color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '3', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '9:30 - 10:05', color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '4', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '10:05 - 10:40',
                                    color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Lunch break', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '10:40 - 11:00',
                                    color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '5', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '11:00 - 11:35',
                                    color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '6', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '11:35 - 12:10',
                                    color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '7', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '12:10 - 12:45',
                                    color: textBlackColor)
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S20(
                                    text: '8', color: textBlackColor),
                                getCustomTextW6S10(
                                    text: '12:45 - 1:20', color: textBlackColor)
                              ],
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(getCustomTextW6S16(
                                text: 'Monday'.tr, color: textBlackColor)),
                            DataCell(getCustomTextW6S14(text: '')),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(getCustomTextW6S16(
                                text: '', color: textBlackColor)),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getCustomTextW6S16(
                                text: 'Tuesday'.tr, color: textBlackColor)),
                            DataCell(getCustomTextW6S14(text: '')),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(getCustomTextW6S16(
                                text: '', color: textBlackColor)),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getCustomTextW6S16(
                                text: 'Wednesday'.tr, color: textBlackColor)),
                            DataCell(getCustomTextW6S14(text: '')),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(getCustomTextW6S16(
                                text: '', color: textBlackColor)),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getCustomTextW6S16(
                                text: 'Thursday'.tr, color: textBlackColor)),
                            DataCell(getCustomTextW6S14(text: '')),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(getCustomTextW6S16(
                                text: '', color: textBlackColor)),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Computer'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                          ]),
                          DataRow(cells: [
                            DataCell(getCustomTextW6S16(
                                text: 'Friday'.tr, color: textBlackColor)),
                            DataCell(getCustomTextW6S14(text: '')),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Maths'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Daina'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'English'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(getCustomTextW6S16(
                                text: '', color: textBlackColor)),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: 'Urdu'.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: 'Ms.Sadia'.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: ''.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: ''.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: ''.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: ''.tr, color: textBlackColor)
                              ],
                            )),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getCustomTextW6S16(
                                    text: ''.tr, color: textBlackColor),
                                getVerSpace(1.h),
                                getCustomTextW6S10(
                                    text: ''.tr, color: textBlackColor)
                              ],
                            )),
                          ]),
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
