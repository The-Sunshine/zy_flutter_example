import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _questionTextEditingController =
      TextEditingController();
  late FocusNode _questionFocusNode;

  @override
  void initState() {
    super.initState();
    _questionFocusNode = FocusNode();
    _questionFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar('输入框'),
      backgroundColor: Colors.grey[100],
      body: _initContent(),
    );
  }

  _initContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 0.5, color: Color(0xff999999)),
        ),
        child: TextField(
          controller: _questionTextEditingController,
          focusNode: _questionFocusNode,
          // keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 12, color: Color(0xff1E1E1E)),
          maxLines: null,
          onChanged: (value) {
            print(_questionTextEditingController.text);
            setState(() {});
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(color: Color(0xff999999)),
              hintText: '请输入您遇到的问题（不超过150字）'),
        ),
      ),
    );
  }

/*
  结束编辑状态
  _questionFocusNode.unfocus();
   */

}
