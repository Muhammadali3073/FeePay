import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'checkout_item_screen.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  var totalPrice = 0.obs;
  var price = [2000, 500, 1500, 4500].obs;
  var selectedItem = [1, 1, 1, 1, 1].obs;
  var availableItem = 100.obs;

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    List.generate(
      DataFile.martItemDetailsModel.length,
      (index) {
        return totalPrice.value = totalPrice.value + price[index];
      },
    );
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Obx(
        () => Scaffold(
          appBar: getAppBar(
            text: 'Shopping Cart'.tr,
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
                    },
                  ),
          ),
          bottomNavigationBar: Container(
              height: 14.h,
              padding: EdgeInsets.symmetric(horizontal: 2.5.h),
              child: DataFile.martItemDetailsModel.isEmpty
                  ? Container()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 5.h,
                          width: 100.w,
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          decoration: BoxDecoration(
                              color: backCardColor,
                              border:
                                  Border.all(color: backCardColor, width: 1.px),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.px))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getCustomTextW6S12(
                                  text: 'Total Price:'.tr,
                                  color: textBlackColor),
                              getCustomTextW6S12(
                                  text: language.value != 'English'
                                      ? " ${totalPrice.value} ${'Rs'.tr}"
                                      : 'Rs ${totalPrice.value}',
                                  color: textBlackColor),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const CheckOutItemScreen());
                            },
                            child: fillColorButton(
                                text: 'PROCEED TO SHIPPING'.tr)),
                      ],
                    )),
          body: SafeArea(
            child: DataFile.martItemDetailsModel.isEmpty
                ? Center(
                    child: getCustomTextW6S14(
                        text: 'There is no Item in Cart'.tr,
                        color: accentColor),
                  )
                : SizedBox(
                    width: 100.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getVerSpace(2.h),
                          getCustomTextW6S16(
                              text: 'Stationery Shop'.tr, color: accentColor),
                          getVerSpace(1.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: DataFile.martItemDetailsModel.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 12.h,
                                  width: 100.w,
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.px)),
                                      border: Border.all(
                                          color: borderColor, width: 1.px)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(DataFile
                                                    .martItemDetailsModel[index]
                                                    .imageUrl
                                                    .toString()),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(9.px),
                                                topLeft: Radius.circular(9.px)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              getMartTitle(
                                                text: DataFile
                                                    .martItemDetailsModel[index]
                                                    .title
                                                    .toString()
                                                    .tr,
                                                color: textBlackColor,
                                                maxLines: 2,
                                              ),
                                              getVerSpace(0.5.h),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  getCustomTextW6S14(
                                                    text: language.value !=
                                                            'English'
                                                        ? " ${price[index]} ${'Rs'.tr}"
                                                        : 'Rs ${price[index]}',
                                                    color: accentColor,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      DataFile
                                                          .martItemDetailsModel
                                                          .removeAt(index);
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                      color: accentColor,
                                                      size: 3.h,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (selectedItem[index] > 1) {
                                                  selectedItem[index]--;
                                                  totalPrice.value =
                                                      totalPrice.value -
                                                          price[index];
                                                }
                                              },
                                              child: Icon(
                                                Icons
                                                    .remove_circle_outline_rounded,
                                                size: 2.5.h,
                                                color: accentColor,
                                              ),
                                            ),
                                            getHorSpace(1.h),
                                            getCustomTextW6S12(
                                                text: selectedItem[index]
                                                    .toString(),
                                                color: textBlackColor),
                                            getHorSpace(1.h),
                                            GestureDetector(
                                              onTap: () {
                                                if (selectedItem[index] <
                                                    availableItem.value) {
                                                  selectedItem[index]++;
                                                  totalPrice.value =
                                                      totalPrice.value +
                                                          price[index];
                                                }
                                              },
                                              child: Icon(
                                                Icons.add_circle,
                                                size: 2.5.h,
                                                color: accentColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
