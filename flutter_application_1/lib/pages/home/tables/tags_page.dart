import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({Key? key}) : super(key: key);

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {


  final List<String> _tags = [
    '保时捷','qawdwad','1231','gdfgdfg','46745','保时捷','weqwtqa','3563453','sdgvdv','8768567','lkjkhuy',
  ];
  var _questiontypeIndex = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('tags'),
      backgroundColor: Colors.grey[100],
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 16),
            Wrap(
              children: getTagsList(),
              spacing: 12,
              runSpacing: 16,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.end,
            ),
          ],
        )
      ),
    );
  }

  List<Widget> getTagsList(){

    List<Widget> list = [];
    _tags.forEach((element) {
      list.add(
          Container(
              height: 30,
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
              decoration: BoxDecoration(
                color: _questiontypeIndex == element ? Color(0xffEB485A) : Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(6),
              ),
              child: InkWell(
                  onTap: (){
                    setState(() {
                      _questiontypeIndex = (_questiontypeIndex == element ? '' : element);


                    });
                  },
                  child: Text(
                      element,
                      style: TextStyle(
                        fontSize: 12,
                        color: _questiontypeIndex == element ? Colors.white : Color(0xff1E1E1E),
                      )
                  )
              )
          ));
    });
    return list;
  }

}