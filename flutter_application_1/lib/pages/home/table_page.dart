import 'package:flutter/material.dart';


class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  Widget _itemForRow(BuildContext context, int index) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (index == 0) { /// 左滑删除
            Navigator.of(context).pushNamed('SwipeLeftDeletePage');
          } else if (index == 1) {

          } else {

          }
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

final List datas = [
  '左滑删除',
  'asdasd',
  'asdasd',
  'asdasd',
  'asdasd',
  'asdasd',
];
