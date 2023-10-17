import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'shopping_cart_screen.dart';

class MartItemDetailScreen extends StatefulWidget {
  const MartItemDetailScreen({Key? key}) : super(key: key);

  @override
  State<MartItemDetailScreen> createState() => _MartItemDetailScreenState();
}

class _MartItemDetailScreenState extends State<MartItemDetailScreen> {
  PageController pageController = PageController();
  var currentIndex = 0.obs;
  var isFavorite = false.obs;
  var selectedItem = 1.obs;
  var availableItem = 20.obs;
  var totalPrice = 500.obs;
  var price = 500.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'Product Detail'.tr,
          leading: language.value != 'English'
              ? InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.share_outlined,
                    color: backCardColor,
                  ))
              : IconButton(
                  icon: getAssetImage('back_arrow.png', scale: 5),
                  onPressed: () {
                    Get.back();
                  },
                ),
          actions: language.value == 'English'
              ? InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.share_outlined,
                    color: backCardColor,
                  ))
              : IconButton(
                  icon: getAssetImage('back_arrow.png', scale: 5),
                  onPressed: () {
                    Get.back();
                  },
                ),
        ),
        bottomNavigationBar: Container(
          height: 10.h,
          padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                          ..removeCurrentMaterialBanner()
                          ..showMaterialBanner(showMaterialBanner(context,
                              title: 'Added To Cart'.tr,
                              subTitle: 'SHOW CART'.tr, onTapToCartScreen: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                            Get.to(() => const ShoppingCartScreen());
                          }));
                        Timer(const Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        });
                      },
                      child: fillColorButton(text: 'Add to Cart'.tr))),
              getHorSpace(2.h),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => const ShoppingCartScreen());
                      },
                      child: outlineColorButton(text: 'Buy Now'.tr))),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 100.w,
                    child: PageView.builder(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: DataFile.martItemDetailsModel.length,
                      onPageChanged: (value) {
                        currentIndex.value = value;
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          height: 25.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(DataFile
                                      .martItemDetailsModel[index].imageUrl
                                      .toString()),
                                  fit: BoxFit.cover)),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: DataFile.martItemDetailsModel
                        .asMap()
                        .entries
                        .map((entry) {
                      return Expanded(
                        child: Container(
                          height: 2.px,
                          decoration: BoxDecoration(
                              color: (currentIndex.value == entry.key
                                  ? accentColor
                                  : backCardColor)),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getVerSpace(2.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: getMartTitleDetails(
                                      text: DataFile
                                          .martItemDetailsModel[0].title
                                          .toString()
                                          .tr,
                                      color: textBlackColor),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isFavorite.value = !isFavorite.value;
                                  },
                                  child: isFavorite.value
                                      ? Icon(
                                          Icons.favorite_outlined,
                                          color: redColor,
                                          size: 3.h,
                                        )
                                      : Icon(
                                          Icons.favorite_border_outlined,
                                          color: redColor,
                                          size: 3.h,
                                        ),
                                )
                              ],
                            ),
                            getVerSpace(0.5.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star_rate,
                                  size: 3.h,
                                  color: backCardColor,
                                ),
                                Icon(
                                  Icons.star_rate,
                                  size: 3.h,
                                  color: backCardColor,
                                ),
                                Icon(
                                  Icons.star_rate,
                                  size: 3.h,
                                  color: backCardColor,
                                ),
                                Icon(
                                  Icons.star_rate,
                                  size: 3.h,
                                  color: backCardColor,
                                ),
                                Icon(
                                  Icons.star_rate,
                                  size: 3.h,
                                  color: backCardColor,
                                ),
                                getCustomTextW6S12(
                                    text: ' (4.5)', color: textBlackColor)
                              ],
                            ),
                            Divider(color: backCardColor),
                            getVerSpace(0.5.h),
                            itemDetailCard(
                              title: 'Price:',
                              subTitle: language.value != 'English'
                                  ? '${price.value} ${'Rs'.tr}'
                                  : 'Rs ${price.value}',
                            ),
                            getVerSpace(0.5.h),
                            itemDetailCard(
                              title: 'Total Price:',
                              subTitle: language.value != 'English'
                                  ? " ${totalPrice.value} ${'Rs'.tr}"
                                  : "Rs ${totalPrice.value}",
                            ),
                            getVerSpace(0.5.h),
                            Divider(color: backCardColor),
                            getVerSpace(0.5.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomTextW6S12(
                                    text: 'Quantity:'.tr, color: subTextColor),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (selectedItem.value > 0) {
                                                selectedItem.value--;
                                                totalPrice.value =
                                                    totalPrice.value -
                                                        price.value;
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
                                              text:
                                                  selectedItem.value.toString(),
                                              color: textBlackColor),
                                          getHorSpace(1.h),
                                          GestureDetector(
                                            onTap: () {
                                              if (selectedItem.value <
                                                  availableItem.value) {
                                                selectedItem.value++;
                                                totalPrice.value =
                                                    totalPrice.value +
                                                        price.value;
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
                                    getHorSpace(1.h),
                                    getCustomTextW6S10(
                                        text:
                                            '(${availableItem.value} ${'available'.tr})',
                                        color: subTextColor)
                                  ],
                                ),
                              ],
                            ),
                            getVerSpace(0.5.h),
                            Divider(color: backCardColor),
                            getVerSpace(0.5.h),
                            itemDetailCard(
                              title: 'Brand:'.tr,
                              subTitle: 'Mont Marte'.tr,
                            ),
                            getVerSpace(0.5.h),
                            Divider(color: backCardColor),
                            getVerSpace(0.5.h),
                            ExpandCard(
                              heading: 'Description:'.tr,
                              subheading:
                                  'Describe something or someone. [count] Reporters called the scene “a disaster area,” and I think that was an accurate description. I applied for the position after reading the job description.'
                                      .tr,
                            ),
                            getVerSpace(0.5.h),
                            Divider(color: backCardColor),
                            getVerSpace(0.5.h),
                            itemDetailCard2(title: 'Seller policy'.tr),
                            getVerSpace(1.5.h),
                            itemDetailCard2(title: 'Return policy'.tr),
                            getVerSpace(1.5.h),
                            itemDetailCard2(title: 'Support policy'.tr),
                            getVerSpace(0.5.h),
                            Divider(color: backCardColor),
                            getVerSpace(0.5.h),
                            getCustomTextW6S14(
                                text: 'Product you may also like'.tr,
                                color: textBlackColor),
                            getVerSpace(1.h),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                        width: 100.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: DataFile.martItemDetailsModel.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 18.h,
                                alignment: Alignment.center,
                                margin: language.value != 'English'
                                    ? EdgeInsets.only(
                                    left: 1.5.h, right: index == 0 ? 2.5.h : 0)
                                    : EdgeInsets.only(
                                    right: 1.5.h, left: index == 0 ? 2.5.h : 0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: borderColor, width: 1.px),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.px)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 12.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(DataFile
                                                .martItemDetailsModel[index]
                                                .imageUrl
                                                .toString()),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(9.px),
                                            topLeft: Radius.circular(9.px)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: borderColor,
                                                  width: 1.px))),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 1.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            getMartTitle(
                                              text: DataFile
                                                  .martItemDetailsModel[index]
                                                  .title
                                                  .toString()
                                                  .tr,
                                              color: textBlackColor,
                                            ),
                                            getCustomTextW6S12(
                                              text: DataFile
                                                  .martItemDetailsModel[index]
                                                  .price
                                                  .toString()
                                                  .tr,
                                              color: accentColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      getVerSpace(2.h),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
