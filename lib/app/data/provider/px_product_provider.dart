import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:military/app/data/model/px_product_model.dart';

class PxProductProvider extends GetxService {

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<List<PxProducts>> getData() async {
    var jsonResult = await rootBundle.loadString('assets/data/px_product.json');
    Map<String, dynamic> productsInfoMap = json.decode(jsonResult); // json 을 Map 형태로

    // Map을 루핑 돌려서 List 객체에 add
    List temp = productsInfoMap['row'];
    List<PxProducts>  productsInfo = [];

    for (var element in temp){
      productsInfo.add(PxProducts.fromJson(element));
    }

    return productsInfo;
  }
}
