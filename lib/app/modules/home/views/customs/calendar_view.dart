import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:military/app/modules/home/controllers/customs/calendar_popup_controller.dart';
import 'package:military/app/ui/theme/app_theme.dart';

class CalendarView extends GetView<CalendarPopupController> {
  CalendarView() {
    setListOfDate();
    controller.daysNoUI.value = getDaysNoUI();
  }

  void setListOfDate() {
    controller.dateList.clear();

    final DateTime newDate = DateTime(controller.currentMonthDate.value.year,
        controller.currentMonthDate.value.month, 0);
    int previousMothDay = 0;
    if (newDate.weekday < 7) {
      previousMothDay = newDate.weekday;
      for (int i = 1; i <= previousMothDay; i++) {
        controller.dateList
            .add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
    }
    for (int i = 0; i < (42 - previousMothDay); i++) {
      controller.dateList.add(newDate.add(Duration(days: i + 1)));
    }
    controller.daysNoUI.value = getDaysNoUI();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      border: Border.all(
                        color: AppTheme.dark_grey,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {
                          controller.currentMonthDate.value = DateTime(
                              controller.currentMonthDate.value.year,
                              controller.currentMonthDate.value.month,
                              0);
                          setListOfDate();
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Obx(() {
                      return Text(
                        DateFormat('MMMM, yyyy')
                            .format(controller.currentMonthDate.value),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      border: Border.all(
                        color: AppTheme.dark_grey,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {
                          controller.currentMonthDate.value = DateTime(
                              controller.currentMonthDate.value.year,
                              controller.currentMonthDate.value.month + 2,
                              0);
                          setListOfDate();
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
            child: Row(
              children: getDaysNameUI(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Obx(() {
              return Column(
                children: controller.daysNoUI,
              );
            }),
          ),
        ],
      ),
    );
  }

  List<Widget> getDaysNameUI() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(
        Expanded(
          child: Center(
            child: Obx(() {
              return Text(
                DateFormat('EEE').format(controller.dateList[i]),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.nearlyDarkBlue),
              );
            }),
          ),
        ),
      );
    }
    return listUI;
  }

  List<Widget> getDaysNoUI() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    for (int i = 0; i < controller.dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = controller.dateList[count];
        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      child: Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: isStartDateRadius(date) ? 4 : 0,
                              right: isEndDateRadius(date) ? 4 : 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.initialStartDate != null &&
                                      controller.initialEndDate != null
                                  ? getIsItStartAndEndDate(date) ||
                                          getIsInRange(date)
                                      ? AppTheme.nearlyDarkBlue.withOpacity(0.4)
                                      : Colors.transparent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: isStartDateRadius(date)
                                    ? const Radius.circular(24.0)
                                    : const Radius.circular(0.0),
                                topLeft: isStartDateRadius(date)
                                    ? const Radius.circular(24.0)
                                    : const Radius.circular(0.0),
                                topRight: isEndDateRadius(date)
                                    ? const Radius.circular(24.0)
                                    : const Radius.circular(0.0),
                                bottomRight: isEndDateRadius(date)
                                    ? const Radius.circular(24.0)
                                    : const Radius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32.0)),
                        onTap: () {
                          if (controller.currentMonthDate.value.month ==
                              date.month) {
                            final DateTime newminimumDate = DateTime(
                                controller.minimumDate.value.year,
                                controller.minimumDate.value.month,
                                controller.minimumDate.value.day - 1);
                            if (date.isAfter(newminimumDate)) {
                              onDateClick(date);
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: getIsItStartAndEndDate(date)
                                  ? AppTheme.nearlyDarkBlue
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(32.0)),
                              border: Border.all(
                                color: getIsItStartAndEndDate(date)
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: getIsItStartAndEndDate(date)
                                  ? <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          blurRadius: 4,
                                          offset: const Offset(0, 0)),
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                    color: getIsItStartAndEndDate(date)
                                        ? Colors.white
                                        : controller.currentMonthDate.value
                                                    .month ==
                                                date.month
                                            ? Colors.black
                                            : Colors.grey.withOpacity(0.6),
                                    fontSize: 16,
                                    fontWeight: getIsItStartAndEndDate(date)
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 9,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: DateTime.now().day == date.day &&
                                    DateTime.now().month == date.month &&
                                    DateTime.now().year == date.year
                                ? getIsInRange(date)
                                    ? Colors.white
                                    : AppTheme.nearlyDarkBlue
                                : Colors.transparent,
                            shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        count += 1;
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  bool getIsInRange(DateTime date) {
    if (controller.initialStartDate != null &&
        controller.initialEndDate != null) {
      if (date.isAfter(controller.initialStartDate!) &&
          date.isBefore(controller.initialEndDate!)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool getIsItStartAndEndDate(DateTime date) {
    if (controller.initialStartDate != null &&
        controller.initialStartDate!.day == date.day &&
        controller.initialStartDate!.month == date.month &&
        controller.initialStartDate!.year == date.year) {
      return true;
    } else if (controller.initialEndDate != null &&
        controller.initialEndDate!.day == date.day &&
        controller.initialEndDate!.month == date.month &&
        controller.initialEndDate!.year == date.year) {
      return true;
    } else {
      return false;
    }
  }

  bool isStartDateRadius(DateTime date) {
    if (controller.initialStartDate != null &&
        controller.initialStartDate!.day == date.day &&
        controller.initialStartDate!.month == date.month) {
      return true;
    } else if (date.weekday == 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isEndDateRadius(DateTime date) {
    if (controller.initialEndDate != null &&
        controller.initialEndDate!.day == date.day &&
        controller.initialEndDate!.month == date.month) {
      return true;
    } else if (date.weekday == 7) {
      return true;
    } else {
      return false;
    }
  }

  void onDateClick(DateTime date) {
    if (controller.initialStartDate == null) {
      controller.initialStartDate = date;
    } else if (controller.initialStartDate != date &&
        controller.initialEndDate == null) {
      controller.initialEndDate = date;
    } else if (controller.initialStartDate!.day == date.day &&
        controller.initialStartDate!.month == date.month) {
      controller.initialStartDate = null;
    } else if (controller.initialEndDate!.day == date.day &&
        controller.initialEndDate!.month == date.month) {
      controller.initialEndDate = null;
    }
    if (controller.initialStartDate == null &&
        controller.initialEndDate != null) {
      controller.initialStartDate = controller.initialEndDate;
      controller.initialEndDate = null;
    }
    if (controller.initialStartDate != null &&
        controller.initialEndDate != null) {
      if (!controller.initialEndDate!.isAfter(controller.initialStartDate!)) {
        final DateTime d = controller.initialStartDate!;
        controller.initialStartDate = controller.initialEndDate;
        controller.initialEndDate = d;
      }
      if (date.isBefore(controller.initialStartDate!)) {
        controller.initialStartDate = date;
      }
      if (date.isAfter(controller.initialEndDate!)) {
        controller.initialEndDate = date;
      }
    }

    try {
      controller.startEndDateChange!(
          controller.initialStartDate!, controller.initialEndDate!);
    } catch (_) {}
    controller.daysNoUI.value = getDaysNoUI();
    controller.update();
  }
}
