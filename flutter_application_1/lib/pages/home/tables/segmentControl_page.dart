import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/utils/segment_control.dart';
import 'package:flutter_application_1/utils/tab_indicator_line.dart';

class SegmentControlPage extends StatefulWidget {
  const SegmentControlPage({Key? key}) : super(key: key);

  @override
  State<SegmentControlPage> createState() => _SegmentControlPageState();
}

class _SegmentControlPageState extends State<SegmentControlPage> {
  var list = [
    '豆品',
    '时间',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('SegmentControl'),
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: _initSegment(),
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  _initSegment() {
    return Container(
      child: ZYSegmentedControl(
        titleList: list,
        selectedColor: Colors.red,
        textColor: Colors.red,
        selecetedTextColor: Colors.white,
        onTap: (index) {},
      ),
    );
  }
}
