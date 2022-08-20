import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class APPInfo {

  static late SharedPreferences _prefs;

  static List<MaterialColor> get theme => _themes;

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();

  }

  static bool isShowDraggable = true;

}