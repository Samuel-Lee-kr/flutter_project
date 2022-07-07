import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:military/app/modules/home/controllers/second_tab_controller.dart';
import 'package:military/app/ui/theme/app_theme.dart';
import '../../controllers/px_tab_controller.dart';



class PxThirdListView extends GetView<PxTabController> {
// class PxThirdListView extends GetxController with GetTickerProviderStateMixin {
//   final PxTabController controller2 = Get.put(PxTabController());

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;




  List<String> areaListData = [
    'assets/images/area1.png',
    'assets/images/area2.png',
    'assets/images/area3.png',
    'assets/images/area1.png',
  ];

  PxThirdListView({
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
  }) {
    controller.initAnimationType3();
  }



  @override
  Widget build(BuildContext context) {

    // debugPrint(controller.getData());

    return AnimatedBuilder(
      animation: mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0,
              30 * (1.0 - mainScreenAnimation!.value),
              0.0,
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    areaListData.length,
                    (int index) {
                      final int count = areaListData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: controller.animationType3!,
                          curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn),
                        ),
                      );
                      controller.animationType3?.forward();
                      return AreaView(
                        imagePath: areaListData[index],
                        animation: animation,
                        animationController: controller.animationType3!,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 1.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView({
    Key? key,
    this.imagePath,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final String? imagePath;
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
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.grey.withOpacity(0.4),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  splashColor: AppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {
                    // TODO : detail 페이지로 넘어가야 한다.
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('카테고리 이름'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Image.asset(imagePath!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
