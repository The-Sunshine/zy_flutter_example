import 'package:flutter/material.dart';

/// 悬浮下载按钮组件
class floatingButton extends StatefulWidget {
  const floatingButton({Key? key,
  @required this.clickCallBack,
  }) : super(key: key);

  final clickCallBack;

  @override
  State<floatingButton> createState() => _floatingButtonState();
}

class _floatingButtonState extends State<floatingButton> {
  var show = true;

  @override
  Widget build(BuildContext context) {
    return show ? initContainer() : Container();
  }

  initContainer() {
    return Container(
      height: 45.5,
      width: 200,
      // color: Colors.green,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print('下载');
              widget.clickCallBack();
            },
            child: Image.asset(
              "images/download.png",
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 20,
                height: 20,
                // color: Colors.black,
                margin: EdgeInsets.only(top: 0,right: 0),
                child: GestureDetector(
                  onTap: (){
                    print('关闭');
                    setState(() {
                      show = false;
                    });
                  },
                ),
              )
          ),
        ],
      ),
    );
  }
}

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX;    // X方向的偏移量
  double offsetY;    // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
