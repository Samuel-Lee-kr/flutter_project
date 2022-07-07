import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:military/app/data/model/px.dart';
import 'package:flutter/services.dart';

class PxProvider {

  PxProvider();

  Future<List<Px>> getAll() async {
    var jsonResult = await rootBundle.loadString('assets/data/px_product.json');
    Map<String, dynamic> pxMap = json.decode(jsonResult);

    List temp = pxMap['row'];

    List<Px> result = [];

    int index = 0;
    for (var element in temp) {
      result.add(Px.fromJson(element));
      debugPrint("${index++} element : ${element}");
    }
    return result;
  }
}