import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:military/app/data/model/tmo/tmo.dart';
import 'package:military/app/data/repository/tmo_repository.dart';
import 'package:military/app/modules/home/controllers/home_controller.dart';
import 'package:military/app/modules/home/views/tmo/title_view2.dart';
import 'package:military/app/modules/home/views/tmo/tmo_detail_view.dart';
import 'package:military/app/modules/home/views/tmo/tmo_map_view.dart';
import 'package:military/app/modules/home/views/tmo/tmo_popup_view.dart';

class TmoController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? tmoAnimationController;
  HomeController homeController = Get.find();

  final Completer<GoogleMapController> googleMapController = Completer();
  bool isCreated = false;

  final ScrollController scrollController = ScrollController();
  RxDouble topBarOpacity = 0.0.obs;

  final listViews = <Widget>[].obs;

  BuildContext? context;
  final barrierDismissible = true.obs;

  final count = 4;

  final selectTmo = Tmo(
    oprtime: '',
    gnrltelno: '',
    pstnexpln: '',
    tmo_nm: '',
    rowno: '',
    rmrk: '',
    area: '',
    gun_telno: '',
    latitude: 0.0,
    longitude: 0.0,
  ).obs;

  final selectedLocation = '서울역'.obs;
  final newLocation = '선택 안함'.obs;

  Rx<GoogleMap>? googleMap;
  final markers = <MarkerId, Marker>{}.obs;

  final TmoRepository tmoRepository;
  RxList<Tmo> tmoList = <Tmo>[].obs;

  late Map<String, List<String>> areaAndtmoNm = {};

  TmoController({required this.tmoRepository}) {
    setTmoListAndMap();

    googleMap ??= GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(37.5552782, 126.970676), zoom: 17),
      onMapCreated: (GoogleMapController controller) {
        if(!isCreated) {
          googleMapController.complete(controller);
          isCreated = true;
        }
      },
      markers: <Marker>{
        Marker(
          markerId: const MarkerId('marker_1'),
          position: LatLng(37.5552782, 126.970676),
        )
      },
    ).obs;
    addAllListData();
  }

  Future<void> setTmoListAndMap() async {
    tmoList.value = await tmoRepository.getAll();
    var temp = tmoList[0];
    for (Tmo list in tmoList) {
      areaAndtmoNm[list.area] == null ? areaAndtmoNm[list.area] = [list.tmo_nm] : areaAndtmoNm[list.area]!.add(list.tmo_nm);
      if (list.tmo_nm == '서울역') {
        temp = list;
      }
    }
    print(areaAndtmoNm);
    selectTmo.value = temp;
  }

  void addAllListData() {
    if (listViews.length == count) {
      listViews.clear();
    }

    listViews.add(TitleView2(
        titleTxt: '서울역',
        subTxt: 'TMO 위치선택',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
        onDetailTab: () {
          showDialog<dynamic>(
              context: context!,
              builder: (BuildContext context) => TmoPopupView());
          // builder: (BuildContext context) => CalendarPopupView());
        }));
    listViews.add(TmoMapView(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: homeController.homeViewAnimationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: homeController.homeViewAnimationController!,
    ));

    listViews.add(TitleView2(
        titleTxt: '상세 정보',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
        onDetailTab: () {}));

    listViews.add(TmoDetailView(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: homeController.homeViewAnimationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: homeController.homeViewAnimationController!,
    ));
  }

  void initTmoAnimationController(
      AnimationController homeViewAnimationController) {
    tmoAnimationController ??= Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: homeViewAnimationController, curve: Curves.fastOutSlowIn));
  }

  void initAnimationController() {
    animationController ??= AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
  }

  void changeMap(double lat, double lan) async {
    googleMap!.value = GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(lat, lan), zoom: 17),
      onMapCreated: (GoogleMapController controller) {
        googleMapController.complete(controller);
      },
      markers: <Marker>{
        Marker(
          markerId: const MarkerId('marker_1'),
          position: LatLng(lat, lan),
        )
      },
    );

    final GoogleMapController cont = await googleMapController.future;
    cont.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lan), zoom: 17)));
  }

  void applyPopup() {
    changeDetailData(
        newLocation.value == '' ? selectedLocation.value : newLocation.value);
    changeListData(newLocation.value);
    selectedLocation.value =
        newLocation.value == '' ? selectedLocation.value : newLocation.value;
    newLocation.value = '';
  }

  void changeDetailData(String title) {
    for (Tmo item in tmoList) {
      if (item.tmo_nm == title) {
        selectTmo.value = item;
        print('${item.latitude}, ${item.longitude}');
        changeMap(item.latitude, item.longitude);
      }
    }
  }

  void changeListData(String title) {
    TitleView2 listData = TitleView2(
        titleTxt: title,
        subTxt: 'TMO 위치선택',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
        onDetailTab: (listViews[0] as TitleView2).detail);
    listViews[0] = listData;
  }

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
