import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/data/model/px_product_model.dart';
import 'package:military/app/data/repository/px_product_repository.dart';


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
    await pxProductRepository.getData().then((value) {
      var index = 0;
      for (var element in value){
        pxProductsList.add(element);
        debugPrint("${index++} controller :  ${element.company}" );
      }
    });

    int index = 0;
    for (var element in pxProductsList){
      debugPrint("${index++} controller :  ${element.category}" );
    }

    // todo ->  리스트를 set 해서 카테고리 중복값을 없애고 4개를 넣어라
    // findCategory(pxProductsList.toList());
  }

  findCategory(List list){

    List setList = [];

    for (int i = 0; i < list.length; i++){
      setList.add(list[i]['category']);
      debugPrint('${setList}');
    }

    debugPrint('findCategory');
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
