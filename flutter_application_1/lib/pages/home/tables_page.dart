import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/tables/floating_action_button_page.dart';
import 'package:flutter_application_1/pages/home/tables/pageControl_page.dart';
import 'package:flutter_application_1/pages/home/tables/popView_page.dart';
import 'package:flutter_application_1/pages/home/tables/segmentControl_page.dart';
import 'package:flutter_application_1/pages/home/tables/swipe_left_delete_page.dart';
import 'package:flutter_application_1/pages/home/tables/tags_page.dart';
import 'package:flutter_application_1/pages/home/tables/textField_page.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final List datas = [
    '左滑删除',
    '输入框使用',
    '弹窗',
    'PageControl',
    'tags',
    'SegmentControl',
    '悬浮按钮',

  ];

  _tap(int index) {
    if (index == 0) {
      /// 左滑删除
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SwipeLeftDeletePage();
      }));
    } else if (index == 1) {
      /// 输入框使用
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TextFieldPage();
      }));
    } else if (index == 2) {
      /// 弹窗
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PopViewPage();
      }));
    } else if (index == 3) {
      /// PageControl
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PageControlPage();
      }));
    } else if (index == 4) {
      /// tags
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TagsPage();
      }));
    } else if (index == 5) {
      /// SegmentControlPage
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SegmentControlPage();
      }));
    } else if (index == 6) {
      /// FloatingActionButtonPage
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FloatingActionButtonPage();
      }));
    }
    else {}
  }

  Widget _itemForRow(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _tap(index);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 44,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  datas[index],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemBuilder: _itemForRow,
        itemCount: datas.length,
      ),
    );
  }

}
