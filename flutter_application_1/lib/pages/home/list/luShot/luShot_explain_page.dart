
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/list/list_page/car.dart';

class LuShotExplainPage extends StatefulWidget {
  const LuShotExplainPage({Key? key}) : super(key: key);

  @override
  State<LuShotExplainPage> createState() => _LuShotExplainPageState();
}

class _LuShotExplainPageState extends State<LuShotExplainPage> {

  List<Car> datas = [
    const Car(
        '保时捷',
        'https://img0.baidu.com/it/u=1875746338,171164291&fm=253&fmt=auto&app=120&f=JPEG?w=846&h=477',
        ''
    ),
    const Car(
        '奔驰',
        'https://img0.baidu.com/it/u=2269620487,3600909808&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500',
        ''
    ),
    const Car(
        '宝马',
        'https://img1.baidu.com/it/u=1628168174,64924477&fm=253&fmt=auto&app=120&f=JPEG?w=890&h=500',
        ''
    ),
    const Car(
        '保时捷',
        'https://img0.baidu.com/it/u=1875746338,171164291&fm=253&fmt=auto&app=120&f=JPEG?w=846&h=477',
        ''
    ),
    const Car(
        '奔驰',
        'https://img0.baidu.com/it/u=2269620487,3600909808&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500',
        ''
    ),
    const Car(
        '宝马',
        'https://img1.baidu.com/it/u=1628168174,64924477&fm=253&fmt=auto&app=120&f=JPEG?w=890&h=500',
        ''
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF0F0F0),
      child: CustomScrollView(
        slivers: <Widget>[
          _initContentHeader(),
          SliverToBoxAdapter(
            child: Container(
              height: 16,
            ),
          ),
          _initContentLevel(),
          _initContentExplain(),
        ],
      ),
    );
  }

  _initContentHeader() {
    return SliverToBoxAdapter(
      child: Padding(padding: EdgeInsets.only(top: 16,left: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: 3),
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //     color: QZDefaultColors.goldColor, width: 0.5),
                    borderRadius: BorderRadius.circular(24),
                    // color: Colors.white
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: GestureDetector(
                        onTap: () {


                        },
                        child: CachedNetworkImage(
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            imageUrl: "",
                            placeholder: (context, url) => Image.asset(
                              'images/header_placeholder.png',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'images/header_placeholder.png',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            )
                        ),
                      )
                  ),
                ),
              ],
            ),
            SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        constraints: BoxConstraints(maxWidth: 150),
                        child: Text(
                            "长泽咖喱",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ))),
                    // buildLottie(false)
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "2021-2022 总累计撸998发",
                      style: TextStyle(
                          color: Color(0xffA6A6A6),
                          fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _initContentLevel() {
    return SliverToBoxAdapter(
      child: Padding(padding: EdgeInsets.only(left: 12,right: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 8)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '撸一发等级与奖励',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Container(
                  height: 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: LinearGradient(
                        colors: [Color(0xff8FE4DF), Color(0xffEF8A33)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Text(
                      '等级',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 39)),
                    Text(
                      '撸次数',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 21)),
                    Text(
                      '奖励',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: _itemForRow,
                  itemCount: datas.length,
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemForRow(BuildContext context, int index) {
    return Container(
        margin: const EdgeInsets.fromLTRB(8,12,8,0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xffF0F0F0),
        ),
        child: Padding(padding: EdgeInsets.only(top: 12,bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 4)),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {

                },
                child: Container(
                  width: 56,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: LinearGradient(
                        colors: [Color(0xffF09938), Color(0xffEB5428)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Text(
                      '领取',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 17)),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '3333',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 19)),
              Container(
                width: 140,
                child: Text(
                  'VIP奖励两行字VIP奖励两行字VIP奖励两行字',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff624118),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 7)),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {

                },
                child: Container(
                  width: 56,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: LinearGradient(
                        colors: [Color(0xffF09938), Color(0xffEB5428)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Text(
                      '领取',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 4)),
            ],
          ),
        )
    );
  }

  _initContentExplain() {
    return SliverToBoxAdapter(
      child: Padding(padding: EdgeInsets.all(12),
        child: Container(
          height: 264,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 8)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '撸一发说明：',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 12)),
                Text(
                  '1. 撸一发的意义:夜深人静时,在茄子选妃时,总会有令人有血脉奋张,有撸一发的冲动,茄子希望能够帮助会员收集这些有撸一发意义的影片在我的页中撸一发,也同时让视频有累积撸一发次数给会员参考.\n\n2.茄子也特別制訂了等級及徽章,在您升等時會送你小禮物,詳情請見右上角的撸一发等级与奖励页\n\n3.在会有一个撸一发的图示,会员只要感觉到撸一发时,点击视频的左下角撸一发图示,就完成标注撸一发的动作.\n\n4.为了会员的健康,避免精尽人亡的惨剧,每观影3次才可获取撸',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
