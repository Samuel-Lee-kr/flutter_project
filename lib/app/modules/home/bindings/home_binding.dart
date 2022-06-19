import 'package:get/get.dart';

import 'package:military/app/modules/home/controllers/customs/calendar_popup_controller.dart';
import 'package:military/app/modules/home/controllers/first_tab_controller.dart';
import 'package:military/app/modules/home/controllers/second_tab_controller.dart';
import 'package:military/app/modules/home/controllers/tmo_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TmoController>(
      () => TmoController(),
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
  }
}
