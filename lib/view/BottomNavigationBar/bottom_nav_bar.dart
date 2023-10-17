import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../DashboardScreens/dashboard_screen.dart';
import '../PayFeeScreens/fee_pay_screen.dart';
import '../SettingScreens/Setting_screen.dart';
import '../HomeScreens/home_screen.dart';

var selectBottomNavigationBarIndex = 0.obs;

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var pages = [
    const WelComeScreen(),
    const DashboardScreen(),
    const FeePayScreen(),
    const SettingScreen(),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // floatingActionButton: SizedBox(
        //   height: 9.h,
        //   width: 9.h,
        //   child: FittedBox(
        //     child: FloatingActionButton(
        //       backgroundColor: backgroundColor,
        //       shape: const CircleBorder(),
        //       elevation: 2,
        //       onPressed: () {},
        //       child: CircleAvatar(
        //         backgroundColor: accentColor,
        //         radius: 3.2.h,
        //         child: getAssetImage('home_icon.png', scale: 5),
        //       ),
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: IndexedStack(
            index: selectBottomNavigationBarIndex.value, children: pages),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1.px, color: skipBDColor))),
          width: 100.w,
          height: 9.h,
          child: FABBottomAppBar(
            height: 65.0,
            selectedColor: accentColor,
            color: bottomBarIconColor,
            onTabSelected: (val) {
              selectBottomNavigationBarIndex.value = val;
            },
            items: [
              FABBottomAppBarItem(
                  iconData: 'assets/images/home_icon.png', label: 'Home'.tr),
              FABBottomAppBarItem(
                  iconData: 'assets/images/dashboard_icon.png',
                  label: 'Dashboard'.tr),
              FABBottomAppBarItem(
                  iconData: 'assets/images/fee_pay_icon.png',
                  label: 'Pay Fee'.tr),
              FABBottomAppBarItem(
                  iconData: 'assets/images/settings_icon.png',
                  label: 'Setting'.tr),
            ],
          ),
        ),
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.index, required this.label});

  dynamic iconData;
  int? index;
  var label = '';
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({
    super.key,
    this.items,
    this.centerItemText,
    this.height = 65.0,
    this.iconSize = 30.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  });

  final List<FABBottomAppBarItem>? items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected!(index);
    setState(() {
      selectBottomNavigationBarIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: widget.notchedShape,
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabItem(
            item: widget.items![0],
            index: 0,
            scale: 3.7,
            onPressed: _updateIndex,
          ),
          _buildTabItem(
            item: widget.items![1],
            index: 1,
            scale: 3.8,
            onPressed: _updateIndex,
          ),
          _buildTabItem(
            item: widget.items![2],
            index: 2,
            scale: 4,
            onPressed: _updateIndex,
          ),
          _buildTabItem(
            item: widget.items![3],
            index: 3,
            scale: 4,
            onPressed: _updateIndex,
          )
        ],
      ),
    );
  }

  Widget _buildTabItem(
      {FABBottomAppBarItem? item,
      int? index,
      ValueChanged<int>? onPressed,
      double? scale}) {
    return SizedBox(
      height: 45,
      width: 65,
      child: GestureDetector(
        onTap: () {
          onPressed!(index!);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(item!.iconData,
                color: selectBottomNavigationBarIndex.value == index
                    ? accentColor
                    : bottomBarIconColor,
                scale: scale),
            Flexible(
              child: Text(
                item.label,
                style: TextStyle(
                    color: selectBottomNavigationBarIndex.value == index
                        ? accentColor
                        : bottomBarIconColor,
                    fontSize: 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
