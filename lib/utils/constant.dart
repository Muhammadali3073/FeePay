import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'color_data.dart';
import 'data.dart';

class Constant {
  static String assetImagePath = "assets/images/";
  static String svgImagePath = "assets/svg/";
  static bool isDriverApp = false;
  static const String fontsFamily = "Manrope";

  static double getPercentSize(double total, double percent) {
    return (percent * total) / 100;
  }

  static backToPrev(BuildContext context) {
    Get.back();
  }

  static getCurrency(BuildContext context) {
    return "ETH";
  }

  static sendToNext(BuildContext context, String route, {Object? arguments}) {
    if (arguments != null) {
      Get.toNamed(route, arguments: arguments);
    } else {
      Get.toNamed(route);
    }
  }

  static double getToolbarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top + kToolbarHeight;
  }

  static double getToolbarTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static sendToScreen(Widget widget, BuildContext context) {
    Get.to(widget);
  }

  static backToFinish(BuildContext context) {
    Get.back();
  }

  static closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }

  //// images of Slider
  static final List<Widget> imageSliders = imgList
      .map((item) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backCardColor,
                borderRadius: BorderRadius.all(Radius.circular(15.px)),
                image: DecorationImage(
                    image: NetworkImage(item), fit: BoxFit.cover)),
          ))
      .toList();
}
