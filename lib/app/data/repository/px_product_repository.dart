import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/data/model/px_product_model.dart';
import '../provider/px_product_provider.dart';

class PxProductRepository extends GetxService {
  final PxProductProvider pxProductProvider;


  // 생성자
  PxProductRepository({
    required this.pxProductProvider,
  });

 Future<List<PxProducts>> getData() async {
   List<PxProducts>  productsInfo = [];

   debugPrint('11111111111');

   Map<String, dynamic> result =  await pxProductProvider.getData();

   debugPrint(result.toString());

   productsInfo.add(PxProducts.fromJson(result));

   return productsInfo;
  }
}
