import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/utils/floating_button_download.dart';

class FloatingActionButtonPage extends StatefulWidget {
  const FloatingActionButtonPage({Key? key}) : super(key: key);

  @override
  State<FloatingActionButtonPage> createState() => _FloatingActionButtonPageState();
}

class _FloatingActionButtonPageState extends State<FloatingActionButtonPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('FloatingActionButtonPage'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

        ),
      ),
      floatingActionButton: floatingButton(
        clickCallBack: () {

        },
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerFloat, 0, -14),
    );
  }


}