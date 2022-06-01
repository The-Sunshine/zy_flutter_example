import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';
import 'package:flutter_application_1/macro/refresh.dart';
import 'package:flutter_application_1/macro/screen_size.dart';
import 'package:flutter_application_1/macro/screen_utils.dart';
import 'package:flutter_application_1/pages/home/list_page/car.dart';
import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryRecordPage extends StatefulWidget {
  const HistoryRecordPage({Key? key}) : super(key: key);

  @override
  State<HistoryRecordPage> createState() => _HistoryRecordPageState();
}

class _HistoryRecordPageState extends State<HistoryRecordPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: true);
  List<Car> datas = [
    const Car(
      '保时捷',
      'https://img0.baidu.com/it/u=1875746338,171164291&fm=253&fmt=auto&app=120&f=JPEG?w=846&h=477',
    ),
    const Car(
      '奔驰',
      'https://img0.baidu.com/it/u=2269620487,3600909808&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500',
    ),
    const Car(
      '宝马',
      'https://img1.baidu.com/it/u=1628168174,64924477&fm=253&fmt=auto&app=120&f=JPEG?w=890&h=500',
    ),
    const Car(
      '保时捷',
      'https://img0.baidu.com/it/u=1875746338,171164291&fm=253&fmt=auto&app=120&f=JPEG?w=846&h=477',
    ),

    const Car(
      '奔驰',
      'https://img0.baidu.com/it/u=2269620487,3600909808&fm=253&fmt=auto&app=120&f=JPEG?w=667&h=500',
    ),
    const Car(
      '宝马',
      'https://img1.baidu.com/it/u=1628168174,64924477&fm=253&fmt=auto&app=120&f=JPEG?w=890&h=500',
    ),
  ];

  int page = 1;
  int _totalCount = 1;


  void _onRefresh() {
    this.page = 1;
    datas = [];
    requestData();
  }

  void _onLoading() async {
    this.page ++;
    requestData();
  }

  void requestData() {
    endRefreshWithList(_refreshController, datas);
    // HomeNetManager.buyMovie(
    //     {'page':this.page,
    //       'page_size':10,
    //     }).then((value) {
    //
    //   List list = value.data['c']['videos'];
    //   _totalCount = value.data['c']['total'];
    //
    //   List dataList = [];
    //   list.forEach((element) {
    //     dataList.add(BuyMovieModel.fromJson(element));
    //   });
    //
    //   List<Videos> datasList = List<Videos>.from(list);
    //   datas.addAll(datasList);
    //   setState(() {
    //
    //   });
    //
    //   _refreshController.refreshCompleted();
    //   if (datas.isEmpty) {
    //     _refreshController.loadNoData();
    //   } else {
    //     _refreshController.loadComplete();
    //   }
    //
    // }).onError<DioError>((error, stackTrace) {
    //   EasyLoading.showInfo(error.error["message"]);
    //
    //   _refreshController.refreshCompleted();
    //   _refreshController.loadComplete();
    // });
  }

  _initScrollView() {
    return Container(
      child:SmartRefresher(
        enablePullDown: true,
        header: ZYHomeRefreshHeader(),
        footer: ZYCustomRefreshFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: datas.isEmpty ? _emptyContent() :
        ListView.builder(
          itemBuilder: _itemForRow,
          itemCount: datas.length,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: datas.isEmpty ? _emptyContent() :
      ListView.builder(
        itemBuilder: _itemForRow,
        itemCount: datas.length,
      ),
    );
  }

  _emptyContent() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            prefix_image('home.png'),
            width: 96,
            height: 80,
          ),
          SizedBox(height: 8,),
          Text(
            '暂无观影记录，',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14,
            ),
          ),
          Text(
            '赶紧去首页观看更多影片吧！',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemForRow(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8,16,8,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _initPictureContent(index),
          SizedBox(height: 8,),
          _initBottomTitleContent(index),
          SizedBox(height: 8,),
          _initBottomDesContent(index),
          SizedBox(height: 16,),
          Text(
            '上次看到00:59:52',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffA6A6A6),
            ),
          ),
        ],
      ),
    );
  }

  _initPictureContent(int index) {
    return Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: 'https://www.google.com/imgres?imgurl=http%3A%2F%2Fthepost.net.ph%2Fapp%2Fuploads%2F2021%2F04%2Fthumbnail-1.png&imgrefurl=https%3A%2F%2Fthepost.net.ph%2Fnews%2Fcampus%2Ftup-eyes-face-to-face-classes-in-march-2022%2F&tbnid=vigfBm9og-tMrM&vet=12ahUKEwiTtO7Frv_3AhUK9pQKHXuhCx4QMygFegUIARDEAQ..i&docid=D6FRAeG3qn4UaM&w=1200&h=800&q=tup&ved=2ahUKEwiTtO7Frv_3AhUK9pQKHXuhCx4QMygFegUIARDEAQ',
              fit: BoxFit.cover,
              height: 241,
            ),
          ),
          _initCollectNumber(),
          _initTimeContent(index),
        ]
    );
  }

  _initCollectNumber() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(right: 8,top: 8),
        width: 58,
        height: 24,
        decoration: BoxDecoration(
          color: Color(0x99000000),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8,top: 4),
              child: const Text(
                '800',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffFBF256),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 2,top: 4,right: 8),
                child: Image.asset(
                  prefix_image('home.png'),
                  width: 14,
                  height: 14,
                )
            ),
          ],
        ),
      ),
    );
  }
  _initTimeContent(int index) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x025E5E5E), Color(0xCC2B2B2B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          height: 88,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8,bottom: 8),
                child: Text(
                    '2021-02-23 02:24:12',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                ),
              ),
              Expanded(child: Container()),
              Container(
                padding: EdgeInsets.only(right: 8,bottom: 8),
                child: Text(
                    '09:32:56',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _initBottomTitleContent(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
              '长泽咖喱街了喱街头长泽咖喱街偶遇遇咖喱街了喱街头长泽咖喱街偶咖喱街了喱街头长泽咖喱街偶咖喱街了喱街头长泽咖喱街偶',
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis
          ),
        ),),
        // Expanded(child: Container(
        //   width: 8,
        // )),
        Container(
          padding: EdgeInsets.only(bottom: 2,),
          alignment: Alignment.centerRight,
          child: Text(
            datas[index].name,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xffEB5428),
            ),
          ),
        )
      ],
    );
  }

  _initBottomDesContent(int index) {
    return Row(
      children: [
        Text(
          datas[index].name,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xffA6A6A6),
          ),
        ),
        SizedBox(width: 12,),
        Text(
          datas[index].name,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xffA6A6A6),
          ),
        )
      ],
    );
  }




}
