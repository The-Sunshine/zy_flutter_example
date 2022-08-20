import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

initRefreshScrollView(
  RefreshController controller,
  Function onRefresh,
  Function onLoading,
  Widget? childFunc,
) {
  SmartRefresher(
    enablePullDown: true,
    header: ZYRefreshHeader(),
    footer: ZYCustomRefreshFooter(),
    controller: controller,
    onRefresh: onRefresh(),
    onLoading: onLoading(),
    child: childFunc,
  );
}

endRefresh(RefreshController _refreshController,
    {bool noMore = false}) {
  _refreshController.refreshCompleted();
  if (noMore) {
    _refreshController.loadNoData();
  } else {
    _refreshController.loadComplete();
  }
}

class ZYCustomRefreshFooter extends StatelessWidget {
  const ZYCustomRefreshFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("");
        } else if (mode == LoadStatus.loading) {
          body = CupertinoActivityIndicator();
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败！点击重试！");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("松手,加载更多!");
        } else if (mode == LoadStatus.noMore) {
          body = Text("---我是有底线的---");
        } else {
          body = Text("---我是有底线的---");
        }
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}

class ZYRefreshHeader extends StatelessWidget {
  const ZYRefreshHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaterDropHeader(
      waterDropColor: Colors.yellow,
    );
  }
}

class ZYHomeRefreshHeader extends StatelessWidget {
  const ZYHomeRefreshHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      builder: (c, m) {
        Widget body = Column(
          children: [
            SizedBox(height: 5),
            Text("数据获取中",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            CupertinoActivityIndicator(),
          ],
        );
        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }
}
