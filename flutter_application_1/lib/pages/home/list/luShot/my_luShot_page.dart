
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/pages/home/list/luShot/luShot_explain_page.dart';
import 'package:flutter_application_1/pages/home/list/luShot/luShot_rankingPoint_cell.dart';
import 'package:flutter_application_1/utils/tab_indicator_line.dart';

class MyLuShotPage extends StatefulWidget {
  const MyLuShotPage({Key? key}) : super(key: key);

  @override
  State<MyLuShotPage> createState() => _MyLuShotPageState();
}

class _MyLuShotPageState extends State<MyLuShotPage> with TickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF0F0F0),
      child: CustomScrollView(
        slivers: _initContentList(),
      ),
    );
  }

  List<Widget> _initContentList() {
    List<Widget> list = [];

    list.add(SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: LuShotRankingPointCell(
        )
      )
    ));
    return list;
  }
}
