import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/modules/home/controllers/home_controller.dart';
import 'package:military/app/modules/home/models/tabicon_data.dart';
import 'package:military/app/ui/theme/app_theme.dart';

class BottomBarView extends GetView<HomeController> {

  BottomBarView() {
    controller.initBottomBarViewAnimationController();

    if(controller.tabList.length != 4) {
      controller.tabList.clear();
      for(int i = 0; i < 4; i++) {
        controller.tabList.add(
            TabIcons(index: i, )
        );
        controller.removeAllSelect.add(() {
          setRemoveAllSelection(
              controller.tabIconsList[i]
          );
          controller.changeIndex!(i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: controller.bottomBarViewAnimationController!,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: AppTheme.white,
                elevation: 16.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                                parent: controller.bottomBarViewAnimationController!,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        38.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: controller.tabList[0],
                            ),
                            Expanded(
                              child: controller.tabList[1],
                            ),
                            // SizedBox(
                            //   width: Tween<double>(begin: 0.0, end: 1.0)
                            //           .animate(CurvedAnimation(
                            //               parent: controller.bottomBarViewAnimationController!,
                            //               curve: Curves.fastOutSlowIn))
                            //           .value *
                            //       64.0,
                            // ),
                            Expanded(
                              child: controller.tabList[2],
                            ),
                            Expanded(
                              child: controller.tabList[3],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        // Padding(
        //   padding:
        //       EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        //   child: SizedBox(
        //     width: 38 * 2.0,
        //     height: 38 + 62.0,
        //     child: Container(
        //       alignment: Alignment.topCenter,
        //       color: Colors.transparent,
        //       child: SizedBox(
        //         width: 38 * 2.0,
        //         height: 38 * 2.0,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: ScaleTransition(
        //             alignment: Alignment.center,
        //             scale: Tween<double>(begin: 0.0, end: 1.0).animate(
        //                 CurvedAnimation(
        //                     parent: controller.bottomBarViewAnimationController!,
        //                     curve: Curves.fastOutSlowIn)),
        //             child: Container(
        //               // alignment: Alignment.center,s
        //               decoration: BoxDecoration(
        //                 color: AppTheme.nearlyDarkBlue,
        //                 gradient: LinearGradient(
        //                     colors: [
        //                       AppTheme.nearlyDarkBlue,
        //                       HexColor('#6A88E5'),
        //                     ],
        //                     begin: Alignment.topLeft,
        //                     end: Alignment.bottomRight),
        //                 shape: BoxShape.circle,
        //                 boxShadow: <BoxShadow>[
        //                   BoxShadow(
        //                       color: AppTheme.nearlyDarkBlue
        //                           .withOpacity(0.4),
        //                       offset: const Offset(8.0, 16.0),
        //                       blurRadius: 16.0),
        //                 ],
        //               ),
        //               child: Material(
        //                 color: Colors.transparent,
        //                 child: InkWell(
        //                   splashColor: Colors.white.withOpacity(0.1),
        //                   highlightColor: Colors.transparent,
        //                   focusColor: Colors.transparent,
        //                   onTap: controller.addClick,
        //                   child: Icon(
        //                     Icons.add,
        //                     color: AppTheme.white,
        //                     size: 32,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData? tabIconData) {
    for (int i = 0; i < controller.tabIconsList.length; i++) {
      var tab = controller.tabIconsList[i];
      tab.isSelected = false;
      if (tabIconData!.index == tab.index) {
        tab.isSelected = true;
      }
    }
  }
}

class TabIcons extends GetView<HomeController> {
  int index;

  TabIcons({required this.index}) {
    if(index == controller.imageAssets.length) {
      controller.imageAssets.add(Image.asset(controller.tabIconsList[index].isSelected
          ? controller.tabIconsList[index].selectedImagePath
          : controller.tabIconsList[index].imagePath));
      controller.initTabAnimations(index);
    }
  }

  void setAnimation() {
    controller.tabIconsList[index].animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!controller.tabIconsList[index].isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                          parent: controller.tabIconsList[index].animationController!,
                          curve:
                              Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Obx((){
                    return controller.imageAssets[index];
                  }),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: controller.tabIconsList[index].animationController!,
                            curve: Interval(0.2, 1.0,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: controller.tabIconsList[index].animationController!,
                            curve: Interval(0.5, 0.8,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: controller.tabIconsList[index].animationController!,
                            curve: Interval(0.5, 0.6,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
        
    // path.arcTo(
    //     Rect.fromLTWH(
    //         ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
    //     degreeToRadians(270),
    //     degreeToRadians(70),
    //     false);

    // path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
    //     degreeToRadians(160), degreeToRadians(-140), false);

    // path.arcTo(
    //     Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
    //         radius, radius),
    //     degreeToRadians(200),
    //     degreeToRadians(70),
    //     false);

    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
