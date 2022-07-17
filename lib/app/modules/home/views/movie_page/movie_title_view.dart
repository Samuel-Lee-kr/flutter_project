import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:military/app/ui/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieTitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;
  Function()? onDetailTab;

  MovieTitleView(
      {super.key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation,
      this.onDetailTab});

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
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: InkWell(
                  onTap: TheaterTab,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          titleTxt,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: AppTheme.lightText,
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        onTap: TheaterTab,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                subTxt,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  color: AppTheme.nearlyDarkBlue,
                                ),
                              ),
                              SizedBox(
                                height: 38,
                                width: 26,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: AppTheme.darkText,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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

  void TheaterTab() {
    Get.dialog(
      AlertDialog(
        title: const Text('영화관'),
        content: Container(
          height: Get.height * 1 / 7,
          width: Get.width * 1 / 9,
          child: Column(children: [
            InkWell(
              child: SizedBox(
                width: Get.width,
                child: Center(child: Text('CGV')),
              ),
              onTap: _cgvlaunchURL,
            ),
            SizedBox(height: 10),
            InkWell(
              child: SizedBox(
                width: Get.width,
                child: Center(child: Text('메가박스')),
              ),
              onTap: _megalaunchURL,
            ),
            SizedBox(height: 10),
            InkWell(
              child: SizedBox(
                width: Get.width,
                child: Center(child: Text('롯데시네마')),
              ),
              onTap: _lottelaunchURL,
            )
          ]),
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  _cgvlaunchURL() async {
    const url = 'https://www.cgv.co.kr/ticket/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _megalaunchURL() async {
    const url = 'https://www.megabox.co.kr/booking';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _lottelaunchURL() async {
    const url = 'https://www.lottecinema.co.kr/NLCHS/Ticketing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
