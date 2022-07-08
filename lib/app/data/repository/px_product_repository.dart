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
   Map<String, dynamic> result =  await pxProductProvider.getData();

   List temp = result['row'];
   List<PxProducts>  productsInfo = [];

   int index = 0;
   for (var element in temp){
     productsInfo.add(PxProducts.fromJson(element));

     debugPrint("${index++} element :  ${element}" );
   }
   debugPrint("productInfo :  ${productsInfo[0].category}" );
   return productsInfo;
  }
}
