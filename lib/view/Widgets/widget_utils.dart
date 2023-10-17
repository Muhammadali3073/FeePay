import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/color_data.dart';
import '../../utils/constant.dart';
import '../SplashLanguageScreens/language_screen.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    double? scale,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: scale,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.svgImagePath + image,
    width: width,
    height: height,
    fit: boxFit,
  );
}

getWhiteColorStatusBar() {
  return AppBar(
    backgroundColor: backgroundColor,
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark),
  );
}

getSkipStatusBar() {
  return AppBar(
    backgroundColor: skipBDColor,
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: skipBDColor,
        statusBarColor: skipBDColor,
        statusBarIconBrightness: Brightness.dark),
  );
}

getAccentColorStatusBar() {
  return AppBar(
    backgroundColor: accentColor,
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: accentColor,
        statusBarColor: accentColor,
        statusBarIconBrightness: Brightness.light),
  );
}

getAppBar({leading, actions, text, toolbarHeight, centerTitle}) {
  return AppBar(
    backgroundColor: accentColor,
    toolbarHeight: toolbarHeight ?? 10.h,
    elevation: 0,
    centerTitle: centerTitle ?? true,
    leading: leading,
    actions: [Padding(padding: EdgeInsets.only(right: 2.3.h), child: actions)],
    title: getCustomTextW6S20(text: text, color: backgroundColor),
  );
}

getWelComeAppBar({leading, actions, text1, text2, toolbarHeight, centerTitle}) {
  return AppBar(
    titleSpacing: 0,
    leadingWidth: 3.h,
    backgroundColor: accentColor,
    toolbarHeight: toolbarHeight ?? 10.h,
    elevation: 0,
    centerTitle: centerTitle ?? true,
    leading: leading,
    actions: [Padding(padding: EdgeInsets.only(right: 3.h), child: actions)],
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getCustomTextW6S25(
                text: text1.toString().length > 12
                    ? text1.toString().substring(0, 12)
                    : text1,
                color: backgroundColor),
            getHorSpace(1.h),
            getAssetImage('verified.png', scale: 28),
          ],
        ),
        getVerSpace(0.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            getAssetImage('coin.png', scale: 2.5),
            getHorSpace(1.h),
            getCustomTextW6S20(text: text2, color: backgroundColor),
          ],
        ),
      ],
    ),
  );
}

Widget getCustomTextW6S12({text, color, textAlign}) {
  return Text(
    text ?? '',
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 12.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getMartTitle({text, color, maxLines}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines ?? 1,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 12.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getMartTitleDetails({text, color}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 16.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S9({text, color}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 9.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S10({text, color}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 10.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S14({text, color, textAlign,maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14.px,
      fontFamily: Constant.fontsFamily,
      overflow: TextOverflow.ellipsis
    ),
  );
}

Widget getCustomTextW6S17({text, color, textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 17.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S20({text, color}) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 20.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S18({text, color}) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 18.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S16({text, color, textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S25({text, color}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 25.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S36({text, color}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 36.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

getCustomTextStyleW6S14({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w600,
    fontFamily: Constant.fontsFamily,
    fontSize: 14.px,
  );
}

Widget getCustomTextFormField(
    {controller,
    validator,
    hintText,
    suffixIcon,
    obscureText,
    keyboardType,
    prefixIcon,
    onTap,
    readOnly,
    suffixIconConstraintsWidth,
    onChanged}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    cursorColor: textBlackColor,
    controller: controller,
    validator: validator,
    onTap: onTap,
    onChanged: onChanged,
    readOnly: readOnly ?? false,
    style: getCustomTextStyleW6S14(
      color: textBlackColor,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(10.0.px)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(10.0.px)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.px)),
      contentPadding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 1.3.h),
      suffixIconConstraints: BoxConstraints.tightFor(
          width: suffixIconConstraintsWidth ?? 6.0.h, height: 2.5.h),
      suffixIcon: suffixIcon,
      prefixIconConstraints:
          BoxConstraints.tightFor(width: 7.0.h, height: 3.5.h),
      prefixIcon: prefixIcon,
      isCollapsed: true,
      filled: true,
      fillColor: backgroundColor,
      hintText: hintText,
      hintStyle: getCustomTextStyleW6S14(
        color: hintTextColor,
      ),
      enabled: true,
    ),
  );
}

Widget googleButton({googleLogo, googleText}) {
  return Container(
    height: 45,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.px),
        ),
        border: Border.all(color: borderColor, width: 1.px)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        language.value == 'English'
            ? getAssetImage(googleLogo, scale: 4)
            : getAssetImage(googleText, scale: 4),
        getHorSpace(0.7.h),
        language.value == 'English'
            ? getAssetImage(googleText, scale: 4)
            : getAssetImage(googleLogo, scale: 4),
      ],
    ),
  );
}

Widget facebookButton({facebookIcon}) {
  return Container(
    height: 45,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.px),
        ),
        border: Border.all(color: borderColor, width: 1.px)),
    child: getAssetImage(facebookIcon, scale: 4.2.px),
  );
}

Widget fillColorButton({text, color, loading = false}) {
  return Container(
    height: 5.5.h,
    width: double.infinity,
    alignment: Alignment.center,
    // padding: EdgeInsets.symmetric(vertical: 1.1.h),
    decoration: BoxDecoration(
        color: color ?? accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: color ?? accentColor, width: 1.px)),
    child: loading
        ? SizedBox(
            height: 2.5.h,
            width: 2.5.h,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: backgroundColor,
            ),
          )
        : getCustomTextW6S16(
            text: text,
            color: textWhiteColor,
          ),
  );
}

Widget signOutButton() {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 1.1.h),
    decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: redColor, width: 1.px)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getAssetImage('sign_out_icon.png', scale: 4),
        getHorSpace(2.h),
        getCustomTextW6S16(text: 'Sign Out'.tr, color: textWhiteColor)
      ],
    ),
  );
}

Widget outlineColorButton({text}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 1.1.h),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: accentColor, width: 1.px)),
    child: getCustomTextW6S16(
      text: text,
      color: accentColor,
    ),
  );
}

Widget settingCard({icon, title, arrowColor, scale}) {
  return Container(
    height: 7.h,
    padding: EdgeInsets.symmetric(horizontal: 2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.px)),
      border: Border.all(width: 1, color: borderColor),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
                width: 4.h,
                height: 3.3.h,
                child: getAssetImage(icon, scale: scale ?? 5)),
            getHorSpace(2.h),
            getCustomTextW6S14(
                text: title, color: subTextColor, textAlign: TextAlign.start),
          ],
        ),
        Icon(Icons.arrow_forward_ios_rounded,
            color: arrowColor ?? skyBlueTextColor, size: 2.5.h),
      ],
    ),
  );
}

Widget settingFirstCard(
    {icon, title, subTitle, arrowColor, settingIcon, settingSize, scale}) {
  return Container(
    height: 7.h,
    padding: EdgeInsets.symmetric(horizontal: 2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.px)),
      border: Border.all(width: 1, color: borderColor),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
                width: 4.h,
                height: 3.3.h,
                child: getAssetImage(icon, scale: scale ?? 5)),
            getHorSpace(2.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCustomTextW6S14(text: title, color: subTextColor),
                getCustomTextW6S12(text: subTitle, color: borderColor),
              ],
            ),
          ],
        ),
        Icon(settingIcon ?? Icons.arrow_forward_ios_rounded,
            color: arrowColor ?? skyBlueTextColor, size: settingSize ?? 2.h),
      ],
    ),
  );
}

Widget itemDetailCard({title, subTitle}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      getCustomTextW6S12(text: title, color: subTextColor),
      getCustomTextW6S12(text: subTitle, color: textBlackColor)
    ],
  );
}

Widget itemDetailCard2({title}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      getCustomTextW6S12(text: title, color: textBlackColor),
      Icon(
        Icons.add,
        color: textBlackColor,
        size: 2.5.h,
      )
    ],
  );
}

Widget mainCardForStudent({studentName, studentClass, studentInstitute}) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.only(
              left: 0.5.h,
              bottom: studentInstitute.toString().length > 20 ? 1.5.h : 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              getCustomTextW6S18(
                  text: studentName.toString().tr, color: accentColor),
              getCustomTextW6S10(
                  text: '${'Class'.tr}: ${studentClass.toString().tr}',
                  color: subTextColor),
              getCustomTextW6S10(
                  text: '${'Institute'.tr}: ${studentInstitute.toString().tr}',
                  color: subTextColor),
            ],
          ),
        ),
      ),
      getAssetImage('boy.png', scale: 4),
    ],
  );
}

//ignore: must_be_immutable
class ExpandCard extends StatelessWidget {
  dynamic heading, subheading;

  ExpandCard({super.key, this.heading, this.subheading});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Column(
      children: <Widget>[
        ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
                hasIcon: false,
                tapHeaderToExpand: false,
                crossFadePoint: 20),
            header: getCustomTextW6S12(text: heading, color: subTextColor),
            collapsed: Text(
              subheading,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textBlackColor,
                fontWeight: FontWeight.w600,
                fontSize: 12.px,
                fontFamily: Constant.fontsFamily,
              ),
            ),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var _ in Iterable.generate(1))
                  Text(
                    subheading,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: textBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.px,
                      fontFamily: Constant.fontsFamily,
                    ),
                  ),
              ],
            ),
            builder: (_, collapsed, expanded) {
              return Expandable(
                collapsed: collapsed,
                expanded: expanded,
                theme: const ExpandableThemeData(fadeCurve: Curves.bounceInOut),
              );
            },
          ),
        ),
        if (subheading.toString().length >= 60)
          Align(
            alignment: Alignment.centerRight,
            child: Builder(
              builder: (context) {
                var controller =
                    ExpandableController.of(context, required: true);
                return GestureDetector(
                  onTap: () {
                    controller.toggle();
                  },
                  child: Text(
                    controller!.expanded ? "Read Less".tr : "Read More".tr,
                    style: TextStyle(color: textBlackColor, fontSize: 10.px),
                  ),
                );
              },
            ),
          ),
      ],
    ));
  }
}

MaterialBanner showMaterialBanner(BuildContext context,
    {title, subTitle, onTapToCartScreen}) {
  return MaterialBanner(
      content: getCustomTextW6S12(text: title, color: accentColor),
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      backgroundColor: backCardColor,
      actions: [
        GestureDetector(
            onTap: onTapToCartScreen,
            child: getCustomTextW6S12(text: subTitle, color: skyBlueTextColor)),
      ]);
}
