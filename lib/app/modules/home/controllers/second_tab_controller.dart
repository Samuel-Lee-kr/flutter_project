import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondTabController extends GetxController
    with GetTickerProviderStateMixin {
  Animation<double>? secondTabAnimationController;

  final listViews = <Widget>[].obs;
  final ScrollController scrollController = ScrollController();
  RxDouble topBarOpacity = 0.0.obs;

  final count = 5;

  AnimationController? animationType3;

  void initSecondTabAnimationController(
      AnimationController homeViewAnimationController) {
    secondTabAnimationController ??= Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: homeViewAnimationController, curve: Curves.fastOutSlowIn));
  }

  void initAnimationType3() {
    animationType3 ??= AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
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
