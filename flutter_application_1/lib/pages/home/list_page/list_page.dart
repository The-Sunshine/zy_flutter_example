import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/macro/screen_utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'car.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

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
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _initLeftContainer(index),
                _initRightContainer(index),
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

  _initLeftContainer(int index) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl:
                    'https://www.google.com/imgres?imgurl=http%3A%2F%2Fthepost.net.ph%2Fapp%2Fuploads%2F2021%2F04%2Fthumbnail-1.png&imgrefurl=https%3A%2F%2Fthepost.net.ph%2Fnews%2Fcampus%2Ftup-eyes-face-to-face-classes-in-march-2022%2F&tbnid=vigfBm9og-tMrM&vet=12ahUKEwiTtO7Frv_3AhUK9pQKHXuhCx4QMygFegUIARDEAQ..i&docid=D6FRAeG3qn4UaM&w=1200&h=800&q=tup&ved=2ahUKEwiTtO7Frv_3AhUK9pQKHXuhCx4QMygFegUIARDEAQ',
                fit: BoxFit.cover,
                width: 108,
                height: 72,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0x025E5E5E), Color(0xCC2B2B2B)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  height: 29,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: 3, bottom: 5),
                        child: Image.asset(
                          prefix_image("ic_launcher.png"),
                          width: 8,
                          height: 8,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: 1, bottom: 4),
                        child: Text(
                          datas[index].name,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(right: 2, bottom: 4),
                        child: Text(
                          datas[index].name,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  _initRightContainer(int index) {
    return Container(
        padding: EdgeInsets.only(left: 4),
        height: 72,
        child: Column( /// column外不设置高度，会导致内部 内容不居上
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              width: screenWidth() - (12 + 108 + 4 + 12),
              child: Text(
                datas[index].desc,
                style: TextStyle(
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            /// 相对sizeBox 实现两段文字顶底布局
            Padding(padding: EdgeInsets.all(5)),
            Container(
              child: Text(
                datas[index].name,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7F7F7F),
                ),
              ),
            ),
          ],
        ));
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

final List<Car> datas = [
  const Car(
    '保时捷',
    'https://img0.baidu.com/it/u=1875746338,171164291&fm=253&fmt=auto&app=120&f=JPEG?w=846&h=477',
    '卡公司的卡号丢哈傲了圣诞节礼物基金'
  ),
  const Car(
    '奔驰',
    'https://img0.baidu.com/it/u=2269620487,3600909808&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500',
      '卡公司的物基金'

  ),
  const Car(
    '宝马',
    'https://img1.baidu.com/it/u=1628168174,64924477&fm=253&fmt=auto&app=120&f=JPEG?w=890&h=500',
      '卡公司的卡号丢哈师大好俗和端午活动哈时候打完了洪都拉斯记得拉我进来的骄傲了圣诞节礼物基金'

  ),
  const Car(
    '保时捷',
    'https://img0.baidu.com/it/u=1875746338,171164291&fm=253&fmt=auto&app=120&f=JPEG?w=846&h=477',
      '卡公司的卡号丢哈金'

  ),
  const Car(
    '奔驰',
    'https://img0.baidu.com/it/u=2269620487,3600909808&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500',
      '卡公物基金'

  ),
  const Car(
    '宝马',
    'https://img1.baidu.com/it/u=1628168174,64924477&fm=253&fmt=auto&app=120&f=JPEG?w=890&h=500',
      '卡公司的卡号丢哈师大好俗和端午活动哈时候打完了洪都拉斯记得拉我进来的骄傲了圣诞节礼物基金'
  ),
];
