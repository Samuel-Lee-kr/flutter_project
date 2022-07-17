import 'package:get/get.dart';
import 'package:military/app/data/provider/tmo_provider.dart';
import 'package:military/app/data/repository/tmo_repository.dart';

import 'package:military/app/data/provider/food_menu_provider.dart';
import 'package:military/app/data/repository/food_menu_repository.dart';
import 'package:military/app/modules/home/controllers/customs/calendar_popup_controller.dart';
import 'package:military/app/modules/home/controllers/customs/movie_calendar_popup_controller.dart';
import 'package:military/app/modules/home/controllers/first_tab_controller.dart';
import 'package:military/app/modules/home/controllers/movie_tab_controller.dart';
import 'package:military/app/modules/home/controllers/second_tab_controller.dart';
import 'package:military/app/modules/home/controllers/tmo_controller.dart';
import 'package:military/app/modules/home/controllers/food_menu_controller.dart';

import '../controllers/customs/movie_calendar_popup_controller.dart';
import '../../../data/provider/px_product_provider.dart';
import '../../../data/repository/px_product_repository.dart';
import '../controllers/home_controller.dart';
import '../controllers/px_tab_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    // info -> crow
    await initializePxProduct();
  }
}

// info : 사용자 정보를 읽어오기 위한 파베 초기화 (네트웍이므로 async)
Future initializePxProduct() async {
  FoodMenuProvider foodMenuProvider = FoodMenuProvider();
  FoodMenuRepository foodMenuRepository =
      FoodMenuRepository(foodMenuProvider: foodMenuProvider);

  Get.lazyPut<FoodMenuController>(
    () => FoodMenuController(foodMenuRepository: foodMenuRepository),
  );

  Get.lazyPut<TmoController>(
    () => TmoController(
      tmoRepository: TmoRepository(tmoProvider: TmoProvider()),
    ),
  );
  Get.lazyPut<CalendarPopupController>(
    () => CalendarPopupController(),
  );
  Get.lazyPut<SecondTabController>(
    () => SecondTabController(),
  );
  Get.lazyPut<FirstTabController>(
    () => FirstTabController(),
  );
  Get.lazyPut<HomeController>(
    () => HomeController(),
  );
  Get.lazyPut<MovieTabController>(
    () => MovieTabController(),
  );
  Get.lazyPut<MovieCalendarPopupController>(
    () => MovieCalendarPopupController(),
  );
  Get.lazyPut(
    () => PxTabController(
      pxProductRepository: PxProductRepository(
        pxProductProvider: PxProductProvider(),
      ),
    ),
    fenix: true,
  );
}
