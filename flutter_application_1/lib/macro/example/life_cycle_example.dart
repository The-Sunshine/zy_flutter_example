import 'package:flutter/material.dart';

class LifeCycleExample extends StatefulWidget {
  const LifeCycleExample({Key? key}) : super(key: key);

  @override
  State<LifeCycleExample> createState() => _LifeCycleExampleState();
}

class _LifeCycleExampleState extends State<LifeCycleExample> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //初始化
  @override
  void initState() {
    super.initState();

  }

  //销毁
  @override
  void dispose() {

    super.dispose();
  }

  //push到其他页面
  @override
  void didPushNext() {


  }

  //从其他页面pop回本页面
  @override
  void didPopNext() {

  }

  //本页面被pop掉
  @override
  void didPop() {

  }
}

