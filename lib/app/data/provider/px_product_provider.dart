import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:military/app/data/model/px_product_model.dart';

class PxProductProvider extends GetxService {

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<Map<String, dynamic>> getData() async {
    var result = await rootBundle.loadString('assets/data/px_product.json');
    Map<String, dynamic> productsInfo = json.decode(result);

    debugPrint("productsInfo : ${productsInfo}");

    return productsInfo;
  }
}
