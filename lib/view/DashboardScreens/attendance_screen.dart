import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../../utils/data.dart';
import '../SplashLanguageScreens/language_screen.dart';
import '../Widgets/widget_utils.dart';

class AttendanceScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AttendanceScreen({Key? key}) : super(key: key);

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  var isChart = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: getAppBar(
            text: 'Attendance'.tr,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getVerSpace(2.h),
                      Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: percentageColors.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            percentageColors[index].color,
                                        radius: 1.h,
                                      ),
                                      getHorSpace(1.h),
                                      getCustomTextW6S10(
                                          text: percentageColors[index]
                                              .percentage
                                              .toString(),
                                          color: textBlackColor)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.px)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Colors.lightGreen,
                                          Colors.green,
                                        ],
                                      )),
                                  child: getCustomTextW6S14(
                                      text: 'Well Done'.tr,
                                      color: textWhiteColor),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.px)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Colors.orange,
                                          Colors.deepOrange,
                                        ],
                                      )),
                                  child: getCustomTextW6S14(
                                      text: 'I\'m Concerned'.tr,
                                      color: textWhiteColor),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.px)),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Colors.redAccent,
                                          Colors.red,
                                        ],
                                      )),
                                  child: getCustomTextW6S14(
                                      text: 'Seriously Worried'.tr,
                                      color: textWhiteColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: borderColor,
                      ),
                      getVerSpace(1.h),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            elevation: 5,
                            builder: (BuildContext context) {
                              return Container(
                                height: 12.h,
                                width: 100.w,
                                padding: EdgeInsets.only(
                                    right: 3.h,
                                    left: 3.h,
                                    bottom: 1.h,
                                    top: 2.h),
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.px),
                                        topRight: Radius.circular(15.px))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        isChart.value = !isChart.value;
                                      },
                                      child: fillColorButton(
                                        text: isChart.value
                                            ? '${'Jan'.tr} ${'from'.tr} ${'Jun'.tr}'
                                            : '${'July'.tr} ${'from'.tr} ${'Dec'.tr}',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getCustomTextW6S14(
                                text: !isChart.value
                                    ? '${'Jan'.tr} ${'from'.tr} ${'Jun'.tr}'
                                    : '${'July'.tr} ${'from'.tr} ${'Dec'.tr}',
                                color: accentColor),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: accentColor,
                            )
                          ],
                        ),
                      ),
                      getVerSpace(2.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              !isChart.value
                                  ? SfCartesianChart(
                                      primaryYAxis:
                                          CategoryAxis(visibleMinimum: 10),
                                      primaryXAxis: CategoryAxis(),
                                      tooltipBehavior:
                                          TooltipBehavior(enable: true),
                                      series: <ChartSeries<SalesData, String>>[
                                          ColumnSeries<SalesData, String>(
                                              color: accentColor,
                                              dataSource: monthsData,
                                              xValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.sales,
                                              pointColorMapper:
                                                  (SalesData sales, _) =>
                                                      sales.color,
                                              dataLabelMapper:
                                                  (SalesData sales, _) =>
                                                      sales.percentage,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: true,
                                                textStyle: TextStyle(
                                                  color: textWhiteColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 8.px,
                                                  fontFamily:
                                                      Constant.fontsFamily,
                                                ),
                                                labelAlignment:
                                                    ChartDataLabelAlignment.top,
                                              ))
                                        ])
                                  : SfCartesianChart(
                                      primaryYAxis:
                                          CategoryAxis(visibleMinimum: 10),
                                      primaryXAxis: CategoryAxis(),
                                      tooltipBehavior:
                                          TooltipBehavior(enable: true),
                                      series: <ChartSeries<SalesData, String>>[
                                          ColumnSeries<SalesData, String>(
                                              color: accentColor,
                                              dataSource: monthsData,
                                              xValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (SalesData sales, _) =>
                                                      sales.sales,
                                              pointColorMapper:
                                                  (SalesData sales, _) =>
                                                      sales.color,
                                              dataLabelMapper:
                                                  (SalesData sales, _) =>
                                                      sales.percentage,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                isVisible: true,
                                                textStyle: TextStyle(
                                                  color: textWhiteColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 8.px,
                                                  fontFamily:
                                                      Constant.fontsFamily,
                                                ),
                                                labelAlignment:
                                                    ChartDataLabelAlignment.top,
                                              ))
                                        ]),
                              getVerSpace(2.h),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          )),
    );
  }
}

class SalesData {
  SalesData(this.year, this.percentage, this.sales, this.color);

  final String year;
  final String percentage;
  final double sales;
  final Color? color;
}

class PercentageColors {
  PercentageColors(this.percentage, this.color);

  final String percentage;
  final Color? color;
}
