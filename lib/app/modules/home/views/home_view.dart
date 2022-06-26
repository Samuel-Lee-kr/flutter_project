import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/modules/home/models/tabicon_data.dart';
import 'package:military/app/modules/home/views/bottom_bar_view.dart';
import 'package:military/app/modules/home/views/first_tab_view.dart';
import 'package:military/app/modules/home/views/movie_tab_view.dart';
import 'package:military/app/modules/home/views/second_tab_view.dart';
import 'package:military/app/modules/home/views/tmo_view.dart';
import 'package:military/app/ui/theme/app_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView() {
    controller.initHomeViewAnimationController();
    controller.addClick = () {};
    controller.tabBody = FirstTabView();
    controller.changeIndex = (int index) {
      if (index == 0 || index == 2) {
        controller.homeViewAnimationController?.reverse().then<dynamic>((data) {
          controller.tabBody = FirstTabView();
          controller.update();
        });
      } else if (index == 1) {
        controller.homeViewAnimationController?.reverse().then<dynamic>((data) {
          controller.tabBody = TmoView();
          controller.update();
        });
      } else if (index == 3) {
        controller.homeViewAnimationController?.reverse().then<dynamic>((data) {
          controller.tabBody = MovieTabView();
          controller.update();
        });
      }
    };

    for (int i = 0; i < TabIconData.tabIconsList.length; i++) {
      controller.tabIconsList.add(TabIconData.tabIconsList[i]);
    }
    controller.update();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  GetBuilder<HomeController>(
                      builder: (_) => controller.tabBody!),
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
