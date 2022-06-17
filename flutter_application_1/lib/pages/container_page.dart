import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/home/list_page/list_page.dart';
import 'package:flutter_application_1/pages/mine/mine_page.dart';


class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _Item {
  String name, icon, selected_icon;

  _Item(this.name,this.icon,this.selected_icon);
}
class _ContainerPageState extends State<ContainerPage> {

  List<Widget> pages = [
    HomePage(),
    ListPage(),
    MinePage(),
  ];

  final itemNameIcons = [
    _Item('首页', prefix_image('ic_launcher.png'), prefix_image('ic_launcher.png')),
    _Item('列表', prefix_image('ic_launcher.png'), prefix_image('ic_launcher.png')),
    _Item('我的', prefix_image('ic_launcher.png'), prefix_image('ic_launcher.png')),
  ];

  List<BottomNavigationBarItem> itemList = [];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    if (itemList.length == 0) {
      itemList = itemNameIcons.map((e) => BottomNavigationBarItem(
          icon: Image.asset(
            e.icon,
            width: 30,
            height: 30,
          ),
        label: e.name,
        activeIcon: Image.asset(
          e.selected_icon,
          width: 30,
          height: 30,
        )
      )).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    ZYScreenSize.initialize(context);

    return Scaffold(
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
        ],
      ),

      /// 全局背景色
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        iconSize: 24,
        currentIndex: _selectedIndex,
          /// tabbar选中文字颜色 BottomNavigationBarType.fixed时生效
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: TickerMode(
        enabled: _selectedIndex == index,
        child: pages[index],
      ),
    );
  }
}

