import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:military/app/modules/home/controllers/customs/calendar_popup_controller.dart';

import 'package:military/app/modules/home/controllers/tmo_controller.dart';

class TmoPopView extends GetView<CalendarPopupController> {
  TmoController tmoController = Get.find();

  TmoPopView() {
    controller.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 400,
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: createAccordion()
            ),
          )),
    );
  }

  List<Widget> createAccordion() {
    final map = tmoController.areaAndtmoNm;

    List<Widget> result = [];
    for (String mapKey in map.keys) {
      result.add(GFAccordion(
        title: mapKey,
        contentChild: Column(
          children: List.generate(map[mapKey]!.length,
          (index){
            return createGestureDetector(map[mapKey]![index]);
          }),
        ),
      ));
    }

    return result;
  }

  Widget createGestureDetector(String title) {
    return GestureDetector(
        onTap: () {
          print(title);
          tmoController.newLocation.value = title;
        },
        child: Text(title));
  }
}
