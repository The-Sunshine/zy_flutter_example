import 'package:flutter/material.dart';


/// 动态拼接图片
String prefix_image(String name) {
  String prefix = (name.contains('assets/images/') ? '' : 'assets/images/');
  String suffix = (name.contains('.png') ? '' : '.png');
  return prefix + name + suffix;
}

/// 快速创建appbar
AppBar initAppBar(String title,{List<Widget>? actions}){
  return AppBar(
    backgroundColor: Colors.green,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    title: Text(title,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: actions,
    elevation: 0,
  );
}

