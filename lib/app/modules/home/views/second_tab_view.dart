import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/modules/home/controllers/home_controller.dart';
import 'package:military/app/modules/home/controllers/second_tab_controller.dart';
import 'package:military/app/modules/home/views/customs/calendar_popup_view.dart';
import 'package:military/app/modules/home/views/first/title_view.dart';
import 'package:military/app/modules/home/views/second/second_type1_view.dart';
import 'package:military/app/modules/home/views/second/second_type2_view.dart';
import 'package:military/app/modules/home/views/second/second_type3_view.dart';
import 'package:military/app/ui/theme/app_theme.dart';

class SecondTabView extends GetView<SecondTabController> {
  HomeController homeController = Get.find();

  SecondTabView() {
    controller.initSecondTabAnimationController(
        homeController.homeViewAnimationController!);
    bool isFirst = addAllListData();

    if (isFirst) {
      controller.scrollController.addListener(() {
        if (controller.scrollController.offset >= 24) {
          if (controller.topBarOpacity.value != 1.0) {
            controller.topBarOpacity.value = 1.0;
          }
        } else if (controller.scrollController.offset <= 24 &&
            controller.scrollController.offset >= 0) {
          if (controller.topBarOpacity.value !=
              controller.scrollController.offset / 24) {
            controller.topBarOpacity.value =
                controller.scrollController.offset / 24;
          }
        } else if (controller.scrollController.offset <= 0) {
          if (controller.topBarOpacity.value != 0.0) {
            controller.topBarOpacity.value = 0.0;
          }
        }
      });
    }

  }

  bool addAllListData() {
    if (controller.listViews.length == controller.count) {
      return false;
    }

    controller.listViews.add(
      TitleView(
        titleTxt: 'type1 & type2',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve: Interval((1 / controller.count) * 0, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
      ),
    );

    controller.listViews.add(
      SecondType1View(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve: Interval((1 / controller.count) * 2, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
      ),
    );
    
    controller.listViews.add(
      SecondType2View(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve: Interval((1 / controller.count) * 3, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
      ),
    );

    controller.listViews.add(
      TitleView(
        titleTxt: 'type3',
        subTxt: 'more',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: homeController.homeViewAnimationController!,
            curve: Interval((1 / controller.count) * 4, 1.0,
                curve: Curves.fastOutSlowIn))),
        animationController: homeController.homeViewAnimationController!,
      ),
    );

    controller.listViews.add(
      SecondType3View(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: homeController.homeViewAnimationController!,
                curve: Interval((1 / controller.count) * 5, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController:
            homeController.homeViewAnimationController!,
      ),
    );

    return true;
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: controller.scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: controller.listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              homeController.homeViewAnimationController?.forward();
              return controller.listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: homeController.homeViewAnimationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: controller.secondTabAnimationController!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0,
                    30 * (1.0 - controller.secondTabAnimationController!.value),
                    0.0),
                child: Obx(() {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppTheme.white
                          .withOpacity(controller.topBarOpacity.value),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: AppTheme.grey.withOpacity(
                                0.4 * controller.topBarOpacity.value),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16 - 8.0 * controller.topBarOpacity.value,
                              bottom:
                                  12 - 8.0 * controller.topBarOpacity.value),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Training',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22 +
                                          6 -
                                          6 * controller.topBarOpacity.value,
                                      letterSpacing: 1.2,
                                      color: AppTheme.darkerText,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 38,
                                width: 38,
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(32.0)),
                                  onTap: () {},
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: AppTheme.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog<dynamic>(
                                      context: context,
                                      builder: (BuildContext context) => CalendarPopupView()
                                    ); 
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: Icon(
                                          Icons.calendar_today,
                                          color: AppTheme.grey,
                                          size: 18,
                                        ),
                                      ),
                                      Text(
                                        '15 May',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18,
                                          letterSpacing: -0.2,
                                          color: AppTheme.darkerText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 38,
                                width: 38,
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(32.0)),
                                  onTap: () {},
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: AppTheme.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            );
          },
        )
      ],
    );
  }
}
