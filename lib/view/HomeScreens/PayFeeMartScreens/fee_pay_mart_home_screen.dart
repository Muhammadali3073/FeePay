import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/constant.dart';
import '../../../utils/data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'mart_item_detail_screen.dart';
import 'view_all_mart_items_screen.dart';

class FeePayMartHomeScreen extends StatefulWidget {
  const FeePayMartHomeScreen({Key? key}) : super(key: key);

  @override
  State<FeePayMartHomeScreen> createState() => _FeePayMartHomeScreenState();
}

class _FeePayMartHomeScreenState extends State<FeePayMartHomeScreen> {
  int currentIndex = 0;
  var isClosed = true.obs;
  var searchedList = [].obs;
  final CarouselController sliderController = CarouselController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: getAppBar(
          text: 'FeePay Mart'.tr,
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
          child: SingleChildScrollView(
            child: SizedBox(
              width: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(2.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                    child: getCustomTextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: 'Search'.tr,
                      controller: searchController,
                      onChanged: (value) {
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
                  ),
                  getVerSpace(2.h),
                  SizedBox(
                    height: 18.h,
                    width: 100.w,
                    child: CarouselSlider(
                      items: Constant.imageSliders,
                      carouselController: sliderController,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          }),
                    ),
                  ),
                  getVerSpace(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => sliderController.animateToPage(entry.key),
                        child: Container(
                          width: 10.px,
                          height: 10.px,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (currentIndex == entry.key
                                  ? accentColor
                                  : borderColor)),
                        ),
                      );
                    }).toList(),
                  ),
                  getVerSpace(1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                    child: getCustomTextW6S20(
                        text: 'Featured Categories'.tr, color: accentColor),
                  ),
                  getVerSpace(1.h),
                  SizedBox(
                    height: 12.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: martItemsList.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ViewAllMartItemsScreen(
                                  titleAppBar: martItemsList[index].toString(),
                                ));
                          },
                          child: Container(
                            width: 12.5.h,
                            alignment: Alignment.center,
                            margin: language.value != 'English'
                                ? EdgeInsets.only(
                                    left: 1.5.h, right: index == 0 ? 2.5.h : 0)
                                : EdgeInsets.only(
                                    right: 1.5.h, left: index == 0 ? 2.5.h : 0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.px)),
                                border: Border.all(
                                    color: borderColor, width: 1.px)),
                            child: SizedBox(
                              height: 8.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.category_outlined,
                                    color: accentColor,
                                    size: 5.h,
                                  ),
                                  getCustomTextW6S9(
                                      text: martItemsList[index].toString().tr,
                                      color: textBlackColor),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  getVerSpace(1.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomTextW6S20(
                            text: 'Featured Products'.tr, color: accentColor),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => ViewAllMartItemsScreen(
                                    titleAppBar: 'All Products',
                                  ));
                            },
                            child: getCustomTextW6S14(
                                text: 'View All'.tr, color: subTextColor))
                      ],
                    ),
                  ),
                  getVerSpace(1.h),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: DataFile.martItemDetailsModel.length,
                    padding: EdgeInsets.only(
                      left: 2.5.h,
                      right: 2.5.h,
                      bottom: 4.h,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 1.5.h,
                        crossAxisSpacing: 2.h),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const MartItemDetailScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 1.px),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.px)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 14.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(DataFile
                                          .martItemDetailsModel[index].imageUrl
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
                                            color: borderColor, width: 1.px))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      getMartTitle(
                                        text: DataFile
                                            .martItemDetailsModel[index].title
                                            .toString()
                                            .tr,
                                        color: textBlackColor,
                                      ),
                                      getCustomTextW6S12(
                                        text: DataFile
                                            .martItemDetailsModel[index].price
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List martItemsList = [
  'Uniforms',
  'Craft Supplies',
  'Paint Brushes',
  'Painting Canvases',
  'Sketchbooks',
  'Acrylic Paints',
  'Brush Pen'
];
