import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:military/app/data/model/tmo/tmo.dart';

class TmoProvider {

  TmoProvider();

  Future<List<Tmo>> getAll() async {
    var jsonResult = await rootBundle.loadString('assets/data/tmo.json');
    Map<String, dynamic> tmoMap = json.decode(jsonResult);

    List temp = tmoMap['row'];

    List<Tmo> result = [];

    for (var element in temp) {
      result.add(Tmo.fromJson(element));
    }
    return result;
  }

}