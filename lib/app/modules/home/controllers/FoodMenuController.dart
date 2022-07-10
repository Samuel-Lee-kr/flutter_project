import 'dart:math' as math;
import 'package:military/app/data/model/food_menu_info.dart';
import 'package:military/app/data/repository/food_menu_repository.dart';
import 'package:vector_math/vector_math.dart' as vector;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:military/app/modules/home/models/heechan_view_data.dart';

class FoodMenuController extends GetxController
    with GetTickerProviderStateMixin {
  // first_tab_view.dart 에서 사용
  RxList<FoodMenuInfo> foodMenuInfoList = <FoodMenuInfo>[].obs;
  Animation<double>? firstTabAnimationController;

  final listViews = <Widget>[].obs;
  final ScrollController scrollController = ScrollController();
  RxDouble topBarOpacity = 0.0.obs;

  final FoodMenuRepository foodMenuRepository;

  FoodMenuController({required this.foodMenuRepository}) {
    loadData();
  } // 등록

  final _htype2ListData = HType2Data.tabIconsList.obs; // obs 등록
  get htype2ListData => this._htype2ListData;
  set htype2ListData(value) => this._htype2ListData.value = value;
  final count = 9;

  void loadData() async {
    foodMenuInfoList.clear();
    await foodMenuRepository.getAll().then((value) => value.forEach((element) {
          foodMenuInfoList.add(element);
        }));
  }

  // ListView type2 에서 활용
  AnimationController? animationType2;

  // ListView type4 wave 에서 활용
  AnimationController? animationType4WaveController;
  AnimationController? waveAnimationController;
  Offset bottleOffset1 = Offset(0, 0);
  Offset bottleOffset2 = Offset(60, 0);
  final animList1 = <Offset>[].obs;
  final animList2 = <Offset>[].obs;

  void initFirstTabAnimationController(
      AnimationController homeViewAnimationController) {
    firstTabAnimationController ??= Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: homeViewAnimationController, curve: Curves.fastOutSlowIn));
  }

  void initAnimationType2() {
    animationType2 ??= AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  void initAnimationType4(double percentageValue) {
    animationType4WaveController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    waveAnimationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    animationType4WaveController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationType4WaveController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationType4WaveController?.forward();
      }
    });
    waveAnimationController!.addListener(() {
      animList1.clear();
      for (int i = -2 - bottleOffset1.dx.toInt(); i <= 60 + 2; i++) {
        animList1.add(
          Offset(
            i.toDouble() + bottleOffset1.dx.toInt(),
            math.sin((waveAnimationController!.value * 360 - i) %
                        360 *
                        vector.degrees2Radians) *
                    4 +
                (((100 - percentageValue) * 160 / 100)),
          ),
        );
      }
      animList2.clear();
      for (int i = -2 - bottleOffset2.dx.toInt(); i <= 60 + 2; i++) {
        animList2.add(
          Offset(
            i.toDouble() + bottleOffset2.dx.toInt(),
            math.sin((waveAnimationController!.value * 360 - i) %
                        360 *
                        vector.degrees2Radians) *
                    4 +
                (((100 - percentageValue) * 160 / 100)),
          ),
        );
      }
    });
    waveAnimationController?.repeat();
    animationType4WaveController?.forward();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
