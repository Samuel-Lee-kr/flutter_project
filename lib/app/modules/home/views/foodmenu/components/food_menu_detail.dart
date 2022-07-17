import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/modules/home/models/heechan_view_data.dart';
import 'package:military/app/ui/theme/app_theme.dart';
import 'package:military/main.dart';

import '../../../../../data/model/food_menu_info.dart';
import '../../../controllers/food_menu_controller.dart';

// MealsListView
class FoodMenuDetail extends GetView<FoodMenuController> {
  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  // List<HType2Data> htype2ListData = HType2Data.tabIconsList;

  FoodMenuDetail(
      {this.mainScreenAnimationController, this.mainScreenAnimation}) {
    controller.initAnimationType2();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - mainScreenAnimation!.value), 0.0),
            child: Container(
              //height: 216,
              height: 260, // 높이 ------------------------
              width: double.infinity,
              child: ListView.builder(
                padding:
                    const EdgeInsets.only(top: 0, bottom: 0, right: 4, left: 4),
                //itemCount: htype2ListData.length,
                itemCount: controller.foodMenuInfoList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  //final int count =  htype2ListData.length > 10 ? 10 : htype2ListData.length;
                  final int count = controller.foodMenuInfoList.length > 10
                      ? 10
                      : controller.foodMenuInfoList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: controller.animationType2!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  controller.animationType2?.forward();

                  return Type2View(
                    // htype2Data: htype2ListData[index],
                    foodMenuInfo: controller.foodMenuInfoList[index],
                    animation: animation,
                    animationController: controller.animationType2!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class Type2View extends StatelessWidget {
  const Type2View(
      {Key? key, this.foodMenuInfo, this.animationController, this.animation})
      : super(key: key);

  final FoodMenuInfo? foodMenuInfo;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
              width: 125,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 4, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor('#536349').withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor('#536349'),
                            HexColor('#536349'),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        /*
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                        */
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 16, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '조식',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.2,
                                color: AppTheme.white,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      //foodMenuInfo!.meals.join('\n'),
                                      foodMenuInfo!.brst,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9,
                                        letterSpacing: 0.2,
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //int.parse(foodMenuInfo!.sum_cal) != 0
                            // ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  foodMenuInfo!.sum_cal.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 0.2,
                                      color: AppTheme.white,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                /*
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    'kcal',
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      letterSpacing: 0.2,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),*/
                              ],
                            )
                            /*
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.nearlyWhite,
                                      shape: BoxShape.circle,
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: AppTheme.nearlyBlack
                                                .withOpacity(0.4),
                                            offset: Offset(8.0, 8.0),
                                            blurRadius: 8.0),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.add,
                                        color: HexColor('#536349'),
                                        size: 24,
                                      ),
                                    ),
                                  ),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 22,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child:
                          Image.asset('assets/images/breakfast.png'), // 음식 그림
                      //child: Icon(Icons.food_bank),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
