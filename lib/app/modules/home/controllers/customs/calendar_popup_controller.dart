import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalendarPopupController extends GetxController
    with GetTickerProviderStateMixin {
  final minimumDate = DateTime.now().obs;
  final barrierDismissible = true.obs;
  DateTime? initialStartDate = DateTime.now();
  DateTime? initialEndDate = DateTime.now().add(const Duration(days: 5));
  Function(DateTime, DateTime)? onApplyClick;
  Function()? onCancelClick;

  AnimationController? animationController;

  // calender_view
  Function(DateTime, DateTime)? startEndDateChange;
  final dateList = <DateTime>[].obs;
  final currentMonthDate = DateTime.now().obs;

  var daysNoUI = <Widget>[].obs;

  void initAnimationController() {
    animationController ??= AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
