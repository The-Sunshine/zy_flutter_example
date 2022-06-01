import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/pages/home/list_page/list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
  final tabbars = [ListPage(),Page2(),Page1(),Page1(),Page1(),Page1()];
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
              initSearchView(),
              initSpace(),
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

  initSearchView() {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Text(
            '用一部电影来形容你的2018',
            style: TextStyle(fontSize: 15),
          )
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
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page1');
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('电影'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Page2');
    return Container(
      color: Colors.grey,
      child: Center(
        child: Text('电视'),
      ),
    );
  }
}