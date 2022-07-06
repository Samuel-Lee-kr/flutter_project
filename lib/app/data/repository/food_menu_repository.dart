import 'package:meta/meta.dart';
import 'package:military/app/data/provider/food_menu_provider.dart';

import '../model/food_menu_info.dart';

class FoodMenuRepository {
  FoodMenuProvider foodMenuProvider;

  FoodMenuRepository({required this.foodMenuProvider});

  Future<List<FoodMenuInfo>> getAll() async {
    return await foodMenuProvider.getAll();
  }

  getId(id) {
    //return foodMenuProvider.getId(id);
  }
}
