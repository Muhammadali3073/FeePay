import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../../utils/data.dart';
import '../../SplashLanguageScreens/language_screen.dart';
import '../../Widgets/widget_utils.dart';
import 'mart_item_detail_screen.dart';

//ignore: must_be_immutable
class ViewAllMartItemsScreen extends StatefulWidget {
  ViewAllMartItemsScreen({Key? key, this.titleAppBar}) : super(key: key);
  dynamic titleAppBar;

  @override
  State<ViewAllMartItemsScreen> createState() => _ViewAllMartItemsScreenState();
}

class _ViewAllMartItemsScreenState extends State<ViewAllMartItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        text: widget.titleAppBar.toString().tr,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getMartTitle(
                                      text: DataFile
                                          .martItemDetailsModel[index].title
                                          .toString().tr,
                                      color: textBlackColor,
                                    ),
                                    getCustomTextW6S12(
                                      text: DataFile
                                          .martItemDetailsModel[index].price
                                          .toString().tr,
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
    );
  }
}
