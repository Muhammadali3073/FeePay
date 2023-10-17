import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';

class CheckOutItemScreen extends StatefulWidget {
  const CheckOutItemScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutItemScreen> createState() => _CheckOutItemScreenState();
}

class _CheckOutItemScreenState extends State<CheckOutItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        text: 'Shopping Cart'.tr,
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
      bottomNavigationBar: Container(
          height: 8.h,
          padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 1.h),
          child: GestureDetector(
              onTap: () {},
              child: fillColorButton(text: 'PROCEED TO CHECKOUT'.tr))),
      body: SafeArea(
        child: SizedBox(
          width: 100.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // getVerSpace(2.h),
                // getCustomTextW6S16(
                //     text: 'Stationery Shop', color: accentColor),
                // getVerSpace(1.h),
                // Flexible(
                //   child: ListView.builder(
                //     itemCount: DataFile.martItemDetailsModel.length,
                //     shrinkWrap: true,
                //     physics: const BouncingScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return Container(
                //         height: 12.h,
                //         width: 100.w,
                //         margin: EdgeInsets.only(bottom: 1.h),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.all(
                //                 Radius.circular(10.px)),
                //             border: Border.all(
                //                 color: borderColor, width: 1.px)),
                //         child: Row(
                //           children: [
                //             Expanded(
                //               flex: 1,
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                   image: DecorationImage(
                //                       image: NetworkImage(DataFile
                //                           .martItemDetailsModel[index]
                //                           .imageUrl
                //                           .toString()),
                //                       fit: BoxFit.fill),
                //                   borderRadius: BorderRadius.only(
                //                       bottomLeft: Radius.circular(9.px),
                //                       topLeft: Radius.circular(9.px)),
                //                 ),
                //               ),
                //             ),
                //             Expanded(
                //               flex: 2,
                //               child: Padding(
                //                 padding: EdgeInsets.symmetric(
                //                     horizontal: 1.h),
                //                 child: Column(
                //                   crossAxisAlignment:
                //                   CrossAxisAlignment.start,
                //                   mainAxisAlignment:
                //                   MainAxisAlignment.center,
                //                   children: [
                //                     getMartTitle(
                //                       text: DataFile
                //                           .martItemDetailsModel[1].title
                //                           .toString(),
                //                       color: textBlackColor,
                //                       maxLines: 2,
                //                     ),
                //                     getVerSpace(0.5.h),
                //                     Row(
                //                       crossAxisAlignment:
                //                       CrossAxisAlignment.center,
                //                       mainAxisAlignment:
                //                       MainAxisAlignment
                //                           .spaceBetween,
                //                       children: [
                //                         getCustomTextW6S14(
                //                           text: 'Rs ${price[index]}',
                //                           color: accentColor,
                //                         ),
                //                         GestureDetector(
                //                           onTap: () {
                //                             DataFile
                //                                 .martItemDetailsModel
                //                                 .removeAt(index);
                //                           },
                //                           child: Icon(
                //                             Icons
                //                                 .delete_outline_rounded,
                //                             color: accentColor,
                //                             size: 3.h,
                //                           ),
                //                         )
                //                       ],
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             Padding(
                //               padding: EdgeInsets.all(1.h),
                //               child: Column(
                //                 crossAxisAlignment:
                //                 CrossAxisAlignment.center,
                //                 mainAxisAlignment:
                //                 MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   GestureDetector(
                //                     onTap: () {
                //                       if (selectedItem[index] > 1) {
                //                         selectedItem[index]--;
                //                         totalPrice.value =
                //                             totalPrice.value -
                //                                 price[index];
                //                       }
                //                     },
                //                     child: Icon(
                //                       Icons
                //                           .remove_circle_outline_rounded,
                //                       size: 2.5.h,
                //                       color: accentColor,
                //                     ),
                //                   ),
                //                   getHorSpace(1.h),
                //                   getCustomTextW6S12(
                //                       text: selectedItem[index]
                //                           .toString(),
                //                       color: textBlackColor),
                //                   getHorSpace(1.h),
                //                   GestureDetector(
                //                     onTap: () {
                //                       if (selectedItem[index] <
                //                           availableItem.value) {
                //                         selectedItem[index]++;
                //                         totalPrice.value =
                //                             totalPrice.value +
                //                                 price[index];
                //                       }
                //                     },
                //                     child: Icon(
                //                       Icons.add_circle,
                //                       size: 2.5.h,
                //                       color: accentColor,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
