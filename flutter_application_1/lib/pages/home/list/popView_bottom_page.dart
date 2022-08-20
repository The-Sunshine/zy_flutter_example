import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:animations/animations.dart';

class PopViewBottom extends StatefulWidget {
  const PopViewBottom({Key? key}) : super(key: key);

  @override
  State<PopViewBottom> createState() => _PopViewBottomState();
}

class _PopViewBottomState extends State<PopViewBottom> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('底部弹窗'),
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
      ),
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
        color: Colors.grey,
        width: screenWidth(),
        height: screenHeight(),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 400,
            width: screenWidth(),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xe5ffffff),Color(0xffFFEECE)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
            ),
            child: _popViewDeleteMovie(),
          ),
        )
    );
  }

  _popViewDeleteMovie() {
    return Column(
      children: [
        Text(
          '真的要放弃开通VIP吗？',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 30)),
        Container(
          color: Colors.yellow,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
          ),
          child: Text(
            '真的要放弃开通VIP吗？',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 30)),
        Container(
          color: Colors.yellow,
          height: 300,

        ),
        Padding(padding: EdgeInsets.only(top: 30)),
        Row(
          children: [
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Color(0xffFFEAC5), Color(0xffE9BD6C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {

                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '确定',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffDDB87A),
                      ),
                    ),
                  )
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Color(0xffFFEAC5), Color(0xffE9BD6C)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {

                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '取消',
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
        ),
      ],
    );
  }


}
