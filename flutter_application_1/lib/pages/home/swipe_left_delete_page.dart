
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SwipeLeftDeletePage extends StatefulWidget {
  const SwipeLeftDeletePage({Key? key}) : super(key: key);

  @override
  State<SwipeLeftDeletePage> createState() => _SwipeLeftDeletePageState();
}

class _SwipeLeftDeletePageState extends State<SwipeLeftDeletePage> {

  Widget _itemForRow(BuildContext context, int index) {
    return Slidable(
      key: Key(datas[index].toString()),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (i) {
              delete(index);
            },
            backgroundColor: Colors.red,
            label: '删除',
            icon: Icons.delete,
            foregroundColor: Colors.white,
          ),
        ],
      ),
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

  delete(int index) {
    setState(() {
      datas.removeAt(index);
    });
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
  '11111111111111111111111',
  '22222222222222222222222',
  '33333333333333333333333',
  '44444444444444444444444',
  '55555555555555555555555',
  '66666666666666666666666',
];
