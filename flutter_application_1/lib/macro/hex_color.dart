
import 'package:flutter/material.dart';

/*
HexColor('b67697');
HexColor('#b67697');
HexColor('#88b67697');

原
Color(0xff624118)

 */

/// 颜色扩展 自动添加了0xff
class HexColor extends Color {
  static int _hexColor(String hexColor) {

    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'ff' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_hexColor(hexColor));
}

