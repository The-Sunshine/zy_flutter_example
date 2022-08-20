import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/pages/home/list/history_record_page/history_record_page.dart';
import 'package:flutter_application_1/pages/home/list/list_page/list_page.dart';
import 'package:flutter_application_1/pages/home/list/suggest_feedback.dart';
import 'package:flutter_application_1/pages/home/tables_page.dart';
import 'package:flutter_application_1/pages/home/tables/swipe_left_delete_page.dart';
import 'package:flutter_application_1/pages/home/tables/textField_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final titleList = ['列表', '电视', '综艺', '读书', '音乐', '同城'];
  final tabbars = [TablePage(),ListPage(),HistoryRecordPage(),SuggestFeedbackPage(),SwipeLeftDeletePage(),TextFieldPage()];
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: titleList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('首页'),
      backgroundColor: Colors.yellow,
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: initTabController(),
        ),
      ),
    );
  }

  initTabController() {
    return DefaultTabController(length: titleList.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              initTabbar(),
              initSpace(),
            ];
          },
          body:TabBarView(
            children: tabbars,
            controller: tabController,
          ),
        )
    );
  }

  initTabbar() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        child: TabBar(
          tabs: titleList.map((e) => Text(
            '$e',
            style: TextStyle(fontSize: 15),
          )).toList(),
          isScrollable: true,
          controller: tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
          unselectedLabelColor: Color.fromARGB(255, 117, 117, 117),
          unselectedLabelStyle: TextStyle(fontSize: 18, color: Colors.black),
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
    );
  }

  initSpace() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.yellow,
        height: 2,
      ),
    );
  }

}
