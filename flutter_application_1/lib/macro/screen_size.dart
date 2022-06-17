import 'package:flutter/cupertino.dart';

class ZYScreenSize {
  static MediaQueryData _mediaQueryData = const MediaQueryData();

  static double rpx = 0;
  static double px = 0;
  static double statusBarHeight = 0;
  static double tabBarHeight = 0;

  /// main之后初始化context
  static void initialize(BuildContext context, {double standardWidth = 750}) {

    _mediaQueryData = MediaQuery.of(context);

    statusBarHeight = _mediaQueryData.padding.top;
    tabBarHeight = _mediaQueryData.padding.bottom;

    rpx = _mediaQueryData.size.width / standardWidth;
    px = _mediaQueryData.size.height / standardWidth * 2;
  }

  /// 按照像素来设置
  static double setPx(double size) {
    var realSize = ZYScreenSize.rpx * size * 2;
    return realSize == 0 ? size : realSize;
  }

  /// 按照rxp来设置
  static double setRpx(double size) {
    var realSize = ZYScreenSize.rpx * size;
    return realSize == 0 ? size : realSize;
  }

}

/// 屏幕宽度
double screenWidth() {
  return ZYScreenSize._mediaQueryData.size.width;
}

/// 屏幕高度
double screenHeight() {
  return ZYScreenSize._mediaQueryData.size.height;
}

/// 宽度比适配
double precent_w(double value){
  int designWidth = 375; /// 设计稿宽度
  return value * screenWidth() / designWidth;
}

/// 高度比适配
double precent_h(double value){
  int designHeight = 667; /// 设计稿高度
  return value * screenHeight() / designHeight;
}