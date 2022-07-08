import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/data/model/px_product_model.dart';
import 'package:military/app/data/repository/px_product_repository.dart';

class PxTabController extends GetxController with GetTickerProviderStateMixin {
  // info-1 repository
  final PxProductRepository pxProductRepository;

  // info-2 ui 에서 쓸 원본 데이터
  RxList<PxProducts> pxProductsList = <PxProducts>[].obs;

  List setList = [];

  // info-3 ui 중 카테고리 명칭을 위한 중복제거 데이터 : 임시데이터
  List<dynamic> _categoryList = [];
  List<dynamic> get categoryList => _categoryList;

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

  // info -> 상품데이터 불러오기
  Future<void> getData() async {
    pxProductsList.clear();
    await pxProductRepository.getData().then(
      (value) {
        for (var element in value) {
          pxProductsList.add(element);
          setList.add(element.category);
        }
      },
    );
    // 리스트를 set 해서 카테고리 중복값을 없애고 4개를 넣어라
    _categoryList = setList.toSet().toList();
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
