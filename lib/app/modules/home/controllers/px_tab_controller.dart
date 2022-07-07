import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/data/model/px_product_model.dart';
import 'package:military/app/data/repository/px_product_repository.dart';

// repo 있어야 한다.

class PxTabController extends GetxController with GetTickerProviderStateMixin {
  final PxProductRepository pxProductRepository;
  RxList<PxProducts> pxProductsList = <PxProducts>[].obs;

  PxTabController({
    required this.pxProductRepository,
  });

  Animation<double>? secondTabAnimationController;

  final listViews = <Widget>[].obs;
  final ScrollController scrollController = ScrollController();
  RxDouble topBarOpacity = 0.0.obs;

  final count = 5;

  AnimationController? animationType3;

  void initSecondTabAnimationController(AnimationController homeViewAnimationController) {
    secondTabAnimationController ??= Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: homeViewAnimationController, curve: Curves.fastOutSlowIn),
    );
  }

  void initAnimationType3() {
    animationType3 ??= AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  Future<void> getData() async {


    pxProductsList.clear();
    pxProductsList.value = await pxProductRepository.getData();

    // debugPrint(pxProductsList.toString());
  }

  @override
  void onInit() {
    super.onInit();

    // info -> getData
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
