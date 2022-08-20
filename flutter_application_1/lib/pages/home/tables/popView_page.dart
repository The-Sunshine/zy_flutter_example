import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:animations/animations.dart';

class PopViewPage extends StatefulWidget {
  const PopViewPage({Key? key}) : super(key: key);

  @override
  State<PopViewPage> createState() => _PopViewPageState();
}

class _PopViewPageState extends State<PopViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('左滑删除'),
      backgroundColor: Colors.grey[100],
      body: _initContent(),
    );
  }

  _initContent() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _showGiveUpVip();
      },
      /// 默认显示
      child: Container(
          color: Colors.grey,
          width: screenWidth(),
          height: screenHeight(),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 134,
              width: 236,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xe5ffffff),Color(0xffFFEECE)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Color(0xffffffff),
                  width: 1,
                ),
              ),
              child: _popView(),
            ),
          )
      ),
    );
  }

  _popView() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          width: 236,
          child: Text(
            '为了保障会员权益,请绑定手机,\n绑定成功可继续体验观影。',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Container(
          width: 196,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(36),
          ),
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {

              },
              child: Padding(
                padding: EdgeInsets.only(top: 9),
                child: Text(
                  '去绑定',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              )
          ),
        )
      ],
    );
  }

  /// 点击弹出
  _showGiveUpVip(){
    return showModal(
      context: context,
      //动画过渡配置
      configuration: FadeScaleTransitionConfiguration(
        //阴影背景颜色
        barrierDismissible: false,
        barrierColor: Colors.black54,
        //打开新的Widget 的时间
        transitionDuration: Duration(milliseconds: 200),
        //关闭新的Widget 的时间
        reverseTransitionDuration: Duration(milliseconds: 200),
      ),
      builder: (BuildContext context) {
        //显示的Widget
        return Material(
          type: MaterialType.transparency,
          child: _showGiveUpVipPopView(),
        );
      },
    );
  }

  _showGiveUpVipPopView() {
    return Container(
        width: screenWidth(),
        height: screenHeight(),
        child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: (screenHeight() - 338) / 2)),
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 338,
                          width: 241,
                          child: _popContentView(),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
                          _showAdPopAdView();
                        });
                      },
                      child: Image.asset(
                        prefix_image('home'),
                        fit: BoxFit.cover,
                        width: 28,
                        height: 28,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: (screenHeight() - 338) / 2 - 76 / 2)),
                    Align(
                      child: Image.asset(
                        prefix_image('home'),
                        fit: BoxFit.cover,
                        width: 76,
                        height: 76,
                      ),
                    )
                  ],
                ),

              ],
            )
        )
    );

  }

  _popContentView() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 76 / 2 + 20)),
        Text(
          '真的要放弃开通VIP吗？',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Container(
            width: 193,
            height: 162,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [Color(0xffFFEAC5), Color(0xffE9BD6C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 34),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 8)),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '您可能会错过',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff624118),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 14)),
                  _initGiveUpVIPAlertContent(prefix_image('home'),'全站视频无限观影'),
                  Padding(padding: EdgeInsets.only(top: 12)),
                  _initGiveUpVIPAlertContent(prefix_image('home'),'VIP专享影片'),
                  Padding(padding: EdgeInsets.only(top: 12)),
                  _initGiveUpVIPAlertContent(prefix_image('home'),'VIP免广告'),
                  Padding(padding: EdgeInsets.only(top: 12)),
                  _initGiveUpVIPAlertContent(prefix_image('home'),'更多下载'),
                ],
              ),
            )
        ),
        Padding(padding: EdgeInsets.only(top: 21)),
        Container(
          width: 152,
          height: 32,
          decoration: BoxDecoration(
            color: Color(0xff211D1C),
            borderRadius: BorderRadius.circular(36),
          ),
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  '继续支付',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffDDB87A),
                  ),
                ),
              )
          ),
        ),

      ],
    );
  }

  _initGiveUpVIPAlertContent(String imageName,String title) {
    return Row(
      children: [
        Image.asset(
          imageName,
          fit: BoxFit.cover,
          width: 20,
          height: 20,
        ),
        Padding(padding: EdgeInsets.only(left: 8)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff624118),
          ),
        ),

      ],
    );
  }

  _showAdPopAdView() {
    return showModal(
      context: context,
      //动画过渡配置
      configuration: FadeScaleTransitionConfiguration(
        //阴影背景颜色
        barrierDismissible: false,
        barrierColor: Color(0x7f000000),
        //打开新的Widget 的时间
        transitionDuration: Duration(milliseconds: 200),
        //关闭新的Widget 的时间
        reverseTransitionDuration: Duration(milliseconds: 200),
      ),
      builder: (BuildContext context) {
        //显示的Widget
        return Material(
          type: MaterialType.transparency,
          child: _adPopView(),
        );
      },
    );
  }

  _adPopView() {
    return Container(
        width: screenWidth(),
        height: screenHeight(),
        child: Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: (screenHeight() - 338) / 2)),
                    Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 338,
                          width: 241,
                          child: CachedNetworkImage(
                              imageUrl: '',
                              fit: BoxFit.cover,
                              height: 338,
                              width: 241,
                              placeholder: (ctx,url){
                                return Image.asset(
                                  "images/placeholder.png",
                                  fit: BoxFit.cover,
                                  width: 338,
                                  height: 241,
                                );
                              },
                              errorWidget: (ctx,url,error){
                                return Image.asset(
                                  "images/placeholder.png",
                                  fit: BoxFit.cover,
                                  width: 338,
                                  height: 241,
                                );
                              }
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Image.asset(
                        prefix_image('home'),
                        fit: BoxFit.cover,
                        width: 28,
                        height: 28,
                      ),
                    )
                  ],
                ),
              ],
            )
        )
    );
  }

}

