import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/modules/home/controllers/customs/calendar_popup_controller.dart';
import 'package:military/app/modules/home/controllers/home_controller.dart';
import 'package:military/app/modules/home/views/customs/calendar_view.dart';
import 'package:military/app/ui/theme/app_theme.dart';

import 'package:intl/intl.dart';

class CalendarPopupView extends GetView<CalendarPopupController> {
  HomeController homeController = Get.find();

  CalendarPopupView() {
    controller.barrierDismissible.value = true;
    controller.initialStartDate = homeController.startDate.value;
    controller.initialEndDate = homeController.endDate.value;

    controller.onApplyClick = (DateTime startData, DateTime endData) {
      homeController.startDate.value = startData;
      homeController.endDate.value = endData;
      controller.initialStartDate = startData;
      controller.initialEndDate = endData;
    };

    controller.onCancelClick = () {};

    controller.initAnimationController();
    controller.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: controller.animationController!,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: controller.animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (controller.barrierDismissible.value) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'From',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color:
                                                Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      GetBuilder<CalendarPopupController>(
                                          builder: (_) => Text(
                                                controller.initialStartDate !=
                                                        null
                                                    ? DateFormat('EEE, dd MMM')
                                                        .format(controller
                                                            .initialStartDate!)
                                                    : '--/--',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              )),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 74,
                                  width: 1,
                                  color: Colors.grey[200],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color:
                                                Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      GetBuilder<CalendarPopupController>(
                                        builder: (_) => Text(
                                          controller.initialEndDate != null
                                              ? DateFormat('EEE, dd MMM')
                                                  .format(controller
                                                      .initialEndDate!)
                                              : '--/-- ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              height: 1,
                            ),
                            CalendarView(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 8),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: AppTheme.nearlyDarkBlue,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      blurRadius: 8,
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      try {
                                        // animationController.reverse().then((f) {

                                        // });
                                        controller.onApplyClick!(
                                            controller.initialStartDate!,
                                            controller.initialEndDate!);
                                        Navigator.pop(context);
                                      } catch (_) {}
                                    },
                                    child: Center(
                                      child: Text(
                                        'Apply',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
