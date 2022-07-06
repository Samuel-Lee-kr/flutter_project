import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:military/app/data/model/food_menu_info.dart';
import 'package:military/app/modules/home/models/heechan_view_data.dart';

class FoodMenuProvider {
  FoodMenuProvider();

  final _htype2ListData = HType2Data.tabIconsList;

  Future<List<FoodMenuInfo>> getAll() async {
    final result11 =
        await rootBundle.loadString('assets/data/heechan_sample.json');
    Map<String, dynamic> res12 = json.decode(result11);
    //  HType2Data = HType2Data.tabIconsList[0];
    //return res12.map((e) => FoodMenuInfo.fromJson(e)).toList();
    List aa = res12['test'];
    List<FoodMenuInfo> bb = [];
    aa.forEach((element) => bb.add(FoodMenuInfo.fromJson(element)));
    print(bb.toString());

    //res12.map((key, value) => null)
    //);
    // final aa = FoodMenuInfo.fromJson(res12['test']); // 리턴 절차

    // _htype2ListData.tabIconsList[0]
    return bb;
  }
}
