
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:animations/animations.dart';

class PopViewSureCancelPage extends StatefulWidget {
  const PopViewSureCancelPage({Key? key}) : super(key: key);

  @override
  State<PopViewSureCancelPage> createState() => _PopViewSureCancelPageState();
}

class _PopViewSureCancelPageState extends State<PopViewSureCancelPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('确认删除弹窗'),
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
        barrierColor: Color(0x7F000000),
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
        color: Color(0x7F000000),
        width: screenWidth(),
        height: screenHeight(),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 158,
            width: 295,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white,
            ),
            child: _popViewDeleteMovie(),
          ),
        )
    );
  }

  _popViewDeleteMovie() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 52)),
        const Text(
          '确定删除此撸点？',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 24)),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 8)),
            Container(
              width: 136,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color(0xffF0F0F0),
              ),
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '取消',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff7F7F7F),
                      ),
                    ),
                  )
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: 136,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color(0xffEB485A),
              ),
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {

                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '删除',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 8)),
          ],
        ),
      ],
    );
  }

}
