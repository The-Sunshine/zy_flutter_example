import 'package:flutter/cupertino.dart';
import 'dart:ui';

class ZYScreenSize {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double rpx = 0;
  static double px = 0;
  static double statusBarHeight = 0;
  static double tabBarHeight = 0;

  /// main之后初始化context
  static void initialize(BuildContext context, {double standardWidth = 750}) {

    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    statusBarHeight = _mediaQueryData.padding.top;
    tabBarHeight = _mediaQueryData.padding.bottom;

    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
  }

  // 按照像素来设置
  static double setPx(double size) {
    var realSize = ZYScreenSize.rpx * size * 2;
    return realSize == 0 ? size : realSize;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    var realSize = ZYScreenSize.rpx * size;
    return realSize == 0 ? size : realSize;
  }
}
