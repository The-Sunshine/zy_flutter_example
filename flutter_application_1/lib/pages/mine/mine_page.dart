import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/macro/screen_utils.dart';
import 'package:flutter_application_1/utils/floating_button_download.dart';
import 'package:flutter_application_1/utils/segment_control.dart';
import 'package:flutter_application_1/utils/tab_indicator_line.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with SingleTickerProviderStateMixin {
  var list = ['豆芽豆品','豆芽时间','豆芽豆品2','豆芽豆品3','豆芽豆品4',
    '豆芽豆品5','豆芽豆品6','豆芽豆品7','豆芽豆品8'];
  int selectedIndex = 0;
  bool selectedNetData = false;
  var _url = 'https://www.baidu.com';
  bool _isClose = false;

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Stack(
            children: <Widget>[
              _initTopHint(),
              Container(
                padding: EdgeInsets.only(top: _isClose ? 0 : 30,),
                child: initCustomScrollView(),
              )
            ],
          ),
        ),
      ),
        floatingActionButton: floatingButton(clickCallBack: (){
          _launchUrl();
        },),
        floatingActionButtonLocation:CustomFloatingActionButtonLocation(
            FloatingActionButtonLocation.centerFloat, 0, -14),
    );
  }

  _initTopHint() {
    return Container(
        height: _isClose ? 0 : 30,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Color(0xffFFFBE6),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Row(
            children: <Widget>[
              Text(
                '已购买'+'部影片，重复观看不消耗观影次数',
                style: TextStyle(
                  color: Color(0xff624118),
                  fontSize: 12,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    setState(() {
                      _isClose = true;
                    });
                  },
                  child: Image.asset(
                    prefix_image("ic_launcher"),
                    width: 16,
                    height: 16,
                  )
              ),
            ],
          ),
        )
    );
  }

  void _launchUrl() async {
    await launch(_url);
  }

  initCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        _initTopImage(),
        _divider(),
        _initSegment(),
        _divider(),
        _initHeader(),
        _divider(),
        _initRemindViews(),
        _divider(),
        _initSegmentControl(),
        _divider(),
        _initCollectList('imageName', '提醒'),
        _initAlert(),
        _divider(),
        _initMyVideo(),
        _divider(),
        _initDataFromNetwork(),
        _divider(),
        _initCollectList(prefix_image('ic_launcher.png'), '我的发布'),
        _initCollectList(prefix_image('ic_launcher.png'), '我的关注'),
        _initCollectList(prefix_image('ic_launcher.png'), '相册'),
        _initCollectList(prefix_image('ic_launcher.png'), '豆列 / 收藏'),
        _divider(),
        _initCollectList(prefix_image('ic_launcher.png'), '钱包'),
      ],
    );
  }

  _initSegment() {
    return SliverToBoxAdapter(
      child: ZYSegmentedControl(
        titleList: const ["111","222"],
        selectedColor: Colors.red,
        textColor: Colors.red,
        selecetedTextColor: Colors.white,

        onTap: (index){
          print(index);
          print(screenWidth());
          print(screenHeight());

          print(ScreenUtils().statusBarHeight);
          print(ScreenUtils().bottomBarHeight);

        },
      ),
    );
  }

  _initTopImage() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 200,
      flexibleSpace: Center(
        child: Container(
          child: CachedNetworkImage(
            imageUrl: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
            width: 300,
            height: 200,
            fit: BoxFit.fill,
            )
        ),
      ),
    );
  }

  _initHeader() {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          SizedBox(height: ZYScreenSize.statusBarHeight + 20,),
          // SizedBox(height: ScreenUtils.getStatusBarH() + 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: GestureDetector(
                  onTap: (){
                    print('点击了头像');
                  },
                  child: CachedNetworkImage(
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    imageUrl: 'adfsgdhhfdas',
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        '用户111',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'VIP',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5,),
                  const Text(
                    'VIP',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  SizedBox(width: 5,),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'ID:12435465412',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            print('点击了复制');
                            EasyLoading.showSuccess('复制成功');
                          },
                          child: const Text(
                            '复制',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ]
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _initRemindViews(){
    return SliverToBoxAdapter(
      child:Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          children: <Widget>[
            Expanded(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    '今日剩余次数',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
              flex: 1,
            ),
            Expanded(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    '今日剩余下载',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
              flex: 1,
            ),
            Expanded(child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    '金币余额',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
              flex: 1,
            ),
          ],
        ),
      )
    );
  }

  _initSegmentControl() {
    return SliverToBoxAdapter(
      child: Row(
        children: <Widget>[
          Expanded(child: Container(),
            flex: 1,
          ),
          Expanded(child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: TabBar(indicator:TabIndicatorline(
              borderSide: BorderSide(width: 2,color: Colors.green),
              IndicatorWidth: 18,
            ),
                tabs: list.map((e) => Text(e)).toList(),
                isScrollable: true,
                controller: tabController,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                labelStyle: TextStyle(fontSize: 18),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(fontSize: 18),
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (index) {
                  this.selectedIndex = index;
                  print('tap is $index');
                }
            ),
          ),
            flex: 3,
          ),
          Expanded(child: Container(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  _initAlert() {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          '暂无新提醒',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  _initMyVideo() {
    return SliverToBoxAdapter(
      child:Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('我的书影音', style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 18,
              )),
              SizedBox(height: 15,),
              AspectRatio(aspectRatio: 343/90,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
                      width: 300,height: 200,fit: BoxFit.fill,
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
  _divider() {
    return SliverToBoxAdapter(
      child: Container(
        color: const Color.fromARGB(255, 247, 247, 247),
        height: 10,
      ),
    );
  }

  _initCollectList(String imageName,String title) {
  // VoidCallback onTap) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        // onTap: onTap,
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10),
              child: Image.asset(
                prefix_image('ic_launcher.png'),
                width: 25,
                height: 25,
              ),
            ),
            Expanded(child: Text(
              title,
              style: TextStyle(fontSize: 15),
            )),
            GestureDetector(
              onTap: (){
                print('object');
              },
              child: Icon(
                Icons.chevron_right,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            )
          ],
        ),
      ),
    );
  }

  _initDataFromNetwork() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          children: <Widget>[
            Text(
              '书影音数据是否来自网络',
              style: TextStyle(color: Colors.red,
                fontSize: 17
              ),
            ),
            Expanded(child: Container()),
            CupertinoSwitch(value: selectedNetData, onChanged: (bool value) {
              setState(() {
                this.selectedNetData = value;
              });
              _setData(value);

              var temp;
              if (value) {
                temp = '书影音数据 使用网络数据，重启APP后生效';
              }else{
                temp = '书影音数据 使用本地数据，重启APP后生效';
              }

              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('提示'),
                  content: Text(temp),
                  actions: <Widget>[
                    MaterialButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('稍后我自己重启')),
                    MaterialButton(onPressed: (){
                      print('重启');
                      Navigator.of(context).pop();
                    }, child: Text('现在重启'))
                  ],
                );
              });
            }),
          ],
        ),
      ),
    );
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedNetData = prefs.getBool('key') ?? false;
    });
  }

  _setData(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('key', value);
  }
}
