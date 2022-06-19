import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/modules/home/controllers/first_tab_controller.dart';
import 'package:military/app/ui/theme/app_theme.dart';

class FirstType4WaveView extends GetView<FirstTabController> {
  final double percentageValue;

  FirstType4WaveView({this.percentageValue = 100.0}) {
    controller.initAnimationType4(percentageValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: controller.animationType4WaveController!,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyDarkBlue.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      bottomLeft: Radius.circular(80.0),
                      bottomRight: Radius.circular(80.0),
                      topRight: Radius.circular(80.0)),
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.nearlyDarkBlue.withOpacity(0.2),
                      AppTheme.nearlyDarkBlue.withOpacity(0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              clipper: WaveClipper(controller.animationType4WaveController!.value, controller.animList1),
            ),
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyDarkBlue,
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.nearlyDarkBlue.withOpacity(0.4),
                      AppTheme.nearlyDarkBlue
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      bottomLeft: Radius.circular(80.0),
                      bottomRight: Radius.circular(80.0),
                      topRight: Radius.circular(80.0)),
                ),
              ),
              clipper: WaveClipper(controller.animationType4WaveController!.value, controller.animList2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      percentageValue.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 0.0,
                        color: AppTheme.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        '%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 6,
              bottom: 8,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: controller.animationType4WaveController!,
                    curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 0,
              bottom: 16,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: controller.animationType4WaveController!,
                    curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 24,
              bottom: 32,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: controller.animationType4WaveController!,
                    curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              bottom: 0,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 16 * (1.0 - controller.animationType4WaveController!.value), 0.0),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(
                        controller.animationType4WaveController!.status == AnimationStatus.reverse
                            ? 0.0
                            : 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/images/bottle.png"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
