import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TmoController extends GetxController {
  
  Animation<double>? tmoAnimationController;

  final ScrollController scrollController = ScrollController();
  RxDouble topBarOpacity = 0.0.obs;

  final listViews = <Widget>[].obs;

  final count = 2;

  void initTmoAnimationController(AnimationController homeViewAnimationController) {
    tmoAnimationController ??= Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: homeViewAnimationController, curve: Curves.fastOutSlowIn));
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
