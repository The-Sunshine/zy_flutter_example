
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/pages/container_page.dart';
import 'package:flutter_application_1/utils/count_down_widget.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool showAD = true;

  Widget build(BuildContext context) {

    // ZYScreenSize.statusBarHeight = MediaQuery.of(context).padding.top;
    // ZYScreenSize.tabBarHeight = MediaQuery.of(context).padding.bottom;
    ZYScreenSize.initialize(context);

    return Stack(
      children: [
        Offstage(
          child: ContainerPage(),
          offstage: showAD,
        ),
        Offstage(
          child: initUI(),
          offstage: !showAD,
        )
      ],
    );
  }

  Container initUI() {
    return Container(
      color: Colors.white,
      width: screenWidth(),
      height: screenHeight(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: screenWidth() / 3,
                  backgroundImage: AssetImage(prefix_image('home.png')),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    '落花有意随流水,流水无心恋落花',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          initSafeArea()
        ],
      ),
    );
  }

  SafeArea initSafeArea() {
    return SafeArea(child: Column (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(right: 30,top: 20),
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
            child: CountDownWidget(
              defaultText: '跳过: ',
                fontSize: 17,
                second: 3,
                onCountDownFinishCallBack: (bool value) {
              if (value) {
                setState(() {
                  showAD = false;
                });
              }
            }),
            decoration: const BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                prefix_image('ic_launcher.png'),
                width: 50,
                height: 50,
              ),
              Padding(padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'hi,豆芽',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

