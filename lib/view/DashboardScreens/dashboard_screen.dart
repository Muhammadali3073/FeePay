import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../HomeScreens/home_screen.dart';
import '../Widgets/widget_utils.dart';
import 'attendance_screen.dart';
import 'classes_screen.dart';
import 'fees_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'Student Dashboard'.tr,
          leading: const SizedBox(
            height: 0,
            width: 0,
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: 100.w,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getVerSpace(2.h),
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      decoration: BoxDecoration(
                                          color: backgroundColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.px),
                                              topRight:
                                                  Radius.circular(15.px))),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                getCustomTextW6S20(
                                                    text: 'Select Other Student'
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
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: DataFile
                                                  .studentDetailsDataList
                                                  .length,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h,
                                                  horizontal: 2.5.h),
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    selectedStudentFromHome
                                                        .value = index;
                                                    Get.back();
                                                  },
                                                  child: Obx(
                                                    () => Container(
                                                      height: 12.h,
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.h),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.h),
                                                      decoration: BoxDecoration(
                                                        color: selectedStudentFromHome
                                                                    .value ==
                                                                index
                                                            ? backCardColor
                                                            : backgroundColor,
                                                        border: Border.all(
                                                            color: selectedStudentFromHome
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
                          height: 12.h,
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            border: Border.all(color: borderColor, width: 1.px),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.px)),
                          ),
                          child: mainCardForStudent(
                            studentName: DataFile
                                .studentDetailsDataList[
                                    selectedStudentFromHome.value]
                                .name,
                            studentClass: DataFile
                                .studentDetailsDataList[
                                    selectedStudentFromHome.value]
                                .grade,
                            studentInstitute: DataFile
                                .studentDetailsDataList[
                                    selectedStudentFromHome.value]
                                .instituteName,
                          ),
                        ),
                        Divider(color: borderColor, thickness: 1.px),
                      ]),
                ),
                Flexible(
                  child: GridView.builder(
                    itemCount: dashBoardImages.length,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.h,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 1) {
                            Get.to(() => AttendanceScreen());
                          } else if (index == 2) {
                            Get.to(() => const FeesScreen());
                          } else if (index == 4) {
                            Get.to(() => const ClassesScreen());
                          }
                        },
                        child: Container(
                          color: backgroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              getAssetImage(dashBoardImages[index], scale: 6),
                              getVerSpace(0.5.h),
                              getCustomTextW6S10(
                                  text: dashBoardName[index].toString().tr,
                                  color: accentColor)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List dashBoardImages = [
  'profile_dashboard.png',
  'student_dashboard.png',
  'fee_dashboard.png',
  'faculity_dashboard.png',
  'classes_dashboard.png',
  'library_dashboard.png',
  'calender_dashboard.png',
  'report_dashboard.png',
  'chat_dashboard.png',
  'feedback_dashboard.png',
  'setup_dashboard.png',
  'blog_dashboard.png',
  'more_dashboard.png'
];
List dashBoardName = [
  'Profile',
  'Attendance',
  'Fees',
  'Facility',
  'Classes',
  'Library',
  'Calender',
  'Report',
  'Chat',
  'Feedback',
  'Setup',
  'Blog',
  'More+'
];
