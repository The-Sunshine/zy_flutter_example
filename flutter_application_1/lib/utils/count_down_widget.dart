
import 'dart:async';
import 'package:flutter/material.dart';

/// 倒计时组件
class CountDownWidget extends StatefulWidget {

  const CountDownWidget({
    Key? key,
    @required this.second = 0,
    @required this.onCountDownFinishCallBack,
    this.fontSize = 17,
    this.fontWeight,
    this.defaultText,
    this.color,
    this.allowJump = 0,
  }) : super(key: key);

  /// 计数器完成回调
  final onCountDownFinishCallBack;
  /// 倒计时秒数
  final second;
  /// 文字大小
  final fontSize;
  /// 文字字体
  final fontWeight;
  /// 默认文字
  final defaultText;
  /// 文字颜色
  final color;
  /// 允许跳过
  final allowJump;

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {

  var _seconds = 0;
  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {});

  void initState() {
    super.initState();

    _seconds = widget.second;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (!widget.allowJump) return;
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
      },
      child: Text(
        widget.defaultText + '$_seconds',
        style: TextStyle(
            color: widget.color,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight
        ),
      ),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds <= 1) {
          widget.onCountDownFinishCallBack(true);
          _cancelTimer();
          return;
        }
      });
      _seconds--;
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }
}
