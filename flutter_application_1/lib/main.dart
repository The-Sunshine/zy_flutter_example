import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/pages/container_page.dart';
import 'dart:io';
import 'package:flutter_application_1/pages/splash_widget.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // body: SplashWidget(),
        body: ContainerPage(),
      ),
    );
  }
}




