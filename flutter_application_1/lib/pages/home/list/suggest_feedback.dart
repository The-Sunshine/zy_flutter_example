import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';

class SuggestFeedbackPage extends StatefulWidget {
  const SuggestFeedbackPage({Key? key}) : super(key: key);

  @override
  State<SuggestFeedbackPage> createState() => _SuggestFeedbackPageState();
}

class _SuggestFeedbackPageState extends State<SuggestFeedbackPage> {


  final List<String> _tags = [
    '保时捷','保时捷保时捷保时捷','保时捷','保时捷','保时捷','保时捷','保保时捷保时捷保时捷时捷','保时捷','保时捷','保时捷','保时捷',
  ];
  final TextEditingController _questionTextEditingController = TextEditingController();
  final TextEditingController _numberTextEditingController = TextEditingController();

  late FocusNode _questionFocusNode;
  late FocusNode _numberFocusNode;

  var _questiontypeIndex = '';
  var _enableSubmit = false;

  @override
  void initState() {
    super.initState();
    _questionFocusNode = FocusNode();
    _numberFocusNode = FocusNode();
    _questionFocusNode.addListener((){
      setState(() {
        _checkSubmitEnable();
      });
    });
    _numberFocusNode.addListener((){
      setState(() {
        _checkSubmitEnable();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: initAppBar('意见反馈',),
      body: _initContainer(),
    );
  }

  _initContainer() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _initQuestionText(),
          Padding(padding: EdgeInsets.all(16)),
          _initNumberText(),
          Padding(padding: EdgeInsets.all(24)),
          Text(
            '问题类型',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.all(16)),
          _initQuestionType(),
          Padding(padding: EdgeInsets.all(46)),
          _initSubmitQuestion(),
        ],
      ),
    );
  }

  _initQuestionText() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 0.5, color: Color(0xff999999)),
      ),
      padding: EdgeInsets.fromLTRB(8, 5, 8, 8),
      child: TextField(
        controller: _questionTextEditingController,
        autofocus: true,
        focusNode: _questionFocusNode,
        style: TextStyle(fontSize: 12, color: Color(0xff1E1E1E)),
        maxLines: null,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color(0xff999999)),
            hintText: '请输入您遇到的问题（不超过150字）'),
      ),

    );
  }

  _initNumberText() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 0.5, color: Color(0xff999999)),
      ),
      padding: EdgeInsets.fromLTRB(8, 9, 8, 12),
      child: TextField(
        controller: _numberTextEditingController,
        focusNode: _numberFocusNode,
        style: TextStyle(fontSize: 14, color: Color(0xff1E1E1E)),
        maxLines: 1,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color(0xff999999)),
            hintText: '您的联系方式'),
      ),
    );
  }

  _initQuestionType() {
    return Container(
      child: Wrap(
        children: getTagsList(),
        spacing: 12,
        runSpacing: 16,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.end,
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
                      _checkSubmitEnable();
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

  _initSubmitQuestion() {
    return Container(
        height: 48,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _enableSubmit ? const Color(0xffEB485A) : const Color(0xffCCCCCC),
            borderRadius: BorderRadius.circular(88)
        ),

        child: GestureDetector(
          onTap: !_enableSubmit ? null : (){
            print('asdasdasd');
          },
          child: const Center(
            child: Text(
              '提交问题',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        )
    );
  }

  _checkSubmitEnable() {
    _enableSubmit = (_questiontypeIndex.isNotEmpty || _questionTextEditingController.text.isNotEmpty)
        && _numberTextEditingController.text.isNotEmpty;
  }
}
