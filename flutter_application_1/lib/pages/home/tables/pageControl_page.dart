import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/page_control.dart';


class PageControlPage extends StatefulWidget {
  const PageControlPage({Key? key}) : super(key: key);

  @override
  State<PageControlPage> createState() => _PageControlPageState();
}

class _PageControlPageState extends State<PageControlPage> {

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 400,
              child: PageView.builder(
                controller: pageController,
                itemBuilder: _buildItems,
                itemCount: 2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SimplePageIndicator(
              itemCount: 2,
              controller: pageController,
              maxSize: 4,
              minSize: 4,
              indicatorColor: Colors.yellow,
              space: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context, int index) {
    return Container(
      child: index == 0 ? Container(
        color: Colors.yellow,
      ) : Container(
        color: Colors.green,
      ),
    );
  }

}
