import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MovieTabController extends GetxController
    with GetTickerProviderStateMixin {
  Animation<double>? secondTabAnimationController;

  final listViews = <Widget>[].obs;
  final ScrollController scrollController = ScrollController();
  RxDouble topBarOpacity = 0.0.obs;

  final count = 5;
  final apiKey = '70e2d90e9add9ca3df9ccfc29bcef2be';
  final date = '20220618';

  final movieRank = ''.obs;
  final movieTitle = ''.obs;
  final movieOpenDate = ''.obs;
  final movieRandOldNew = ''.obs;
  final movieTodayAudi = ''.obs;
  final movieAllAudi = ''.obs;

  final boxOfficeData = [].obs;

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

  Future<void> movieDataHttp() async {
    var url = Uri.parse(
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$apiKey&targetDt=$date');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    var body = jsonDecode(response.body);
    var boxOffice = body['boxOfficeResult']['dailyBoxOfficeList'];
    // print(boxOffice);
    var boxOfficedatas = [];
    for (var i = 0; i < boxOffice.length; i++) {
      var data = [];
      data.add(boxOffice[i]['rank']);
      data.add(boxOffice[i]['movieNm']);
      data.add(boxOffice[i]['openDt']);
      data.add(boxOffice[i]['rankOldAndNew']);
      data.add(boxOffice[i]['audiCnt']);
      data.add(boxOffice[i]['audiAcc']);
      boxOfficedatas.add(data);
    }
    boxOfficeData.value = boxOfficedatas;
    print(boxOfficeData);
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
