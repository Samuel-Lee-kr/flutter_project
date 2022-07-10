import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/modules/home/controllers/tmo_controller.dart';
import 'package:military/app/ui/theme/app_theme.dart';

// MediterranesnDietView
class TmoDetailView extends GetView<TmoController> {
  final AnimationController? animationController;
  final Animation<double>? animation;

  TmoDetailView({this.animationController, this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(34.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          top: 24, left: 16, right: 16, bottom: 16),
                      height: 200,
                      child: Column(
                        children: [
                          // pstnexpln
                          Row(
                            children: [
                              Expanded(child: Center(child: Text('위치 : '))),
                              Expanded(child: Center(child: Obx(() {
                                // return Text(controller.pstnexpln.value);
                                return Text(
                                    controller.selectTmo.value.pstnexpln);
                              }))),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // gnrltelno
                          Row(
                            children: [
                              Expanded(child: Center(child: Text('전화번호 : '))),
                              Expanded(child: Center(child: Obx(() {
                                // return Text(controller.gnrltelno.value);
                                return Text(
                                    controller.selectTmo.value.gnrltelno);
                              }))),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // gun_telno
                          Row(
                            children: [
                              Expanded(child: Center(child: Text('군번호 : '))),
                              Expanded(child: Center(child: Obx(() {
                                // return Text(controller.gun_telno.value
                                //     .replaceAll(" / ", "\n"));
                                return Text(controller.selectTmo.value.gun_telno
                                    .replaceAll(" / ", "\n"));
                              }))),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // oprtime
                          Row(
                            children: [
                              Expanded(child: Center(child: Text('운영 시간 : '))),
                              Expanded(child: Center(child: Obx(() {
                                // if (controller.oprtime.value.length < 8) {}
                                // return Text(controller.oprtime.value.length < 10
                                //     ? "${controller.oprtime.value.substring(0, 4)} - ${controller.oprtime.value.substring(4)}"
                                //     : "${controller.oprtime.value.substring(0, 5)} - ${controller.oprtime.value.substring(5)}");
                                if (controller.selectTmo.value.oprtime.length < 8) {}
                                return Text(controller.selectTmo.value.oprtime.length < 10
                                    ? "${controller.selectTmo.value.oprtime.substring(0, 4)} - ${controller.selectTmo.value.oprtime.substring(4)}"
                                    : "${controller.selectTmo.value.oprtime.substring(0, 5)} - ${controller.selectTmo.value.oprtime.substring(5)}");
                              }))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = Paint();
    cPaint.shader = gradient1.createShader(rect);
    cPaint.color = Colors.white;
    cPaint.strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var radian = (math.pi / 180) * degree;
    return radian;
  }
}
