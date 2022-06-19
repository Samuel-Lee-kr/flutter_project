import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/modules/home/models/tabicon_data.dart';
import 'package:military/app/modules/home/views/bottom_bar_view.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
   
  // home_view.dart 에서 활용
  AnimationController? homeViewAnimationController;
  Function(int index)? changeIndex;
  Function()? addClick;
  final tabIconsList = <TabIconData>[].obs;
  Widget? tabBody;

  // bottom_bar_view.dart 에서 활용
  AnimationController? bottomBarViewAnimationController;
  final tabList = <TabIcons>[].obs;

  List<AnimationController> tabAnimations = [];
  List<Function()?> removeAllSelect = [];
  final imageAssets = <Image>[].obs;

  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().add(const Duration(days: 5)).obs;

  // home_view.dart 에서 활용
  void initHomeViewAnimationController() {
    homeViewAnimationController ??=
        homeViewAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  // bottom_bar_view.dart 에서 활용
  void initTabAnimations(int index) {
    tabIconsList[index].animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          removeAllSelect[index]!();
          tabIconsList[index].animationController?.reverse();
          for(int i = 0; i < imageAssets.length; i++) {
            imageAssets[i] = Image.asset(tabIconsList[i].isSelected
                      ? tabIconsList[i].selectedImagePath
                      : tabIconsList[i].imagePath);
          }
        }
      });
  }

  // bottom_bar_view.dart 에서 활용
  void initBottomBarViewAnimationController() {
    bottomBarViewAnimationController ??=
        bottomBarViewAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    bottomBarViewAnimationController?.forward();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
}
