import 'package:flutter/material.dart';

/// SegmentedControl
class ZYSegmentedControl extends StatefulWidget {
  final List? titleList;
  final Color selectedColor;
  final Color textColor;
  final Color selecetedTextColor;
  final double fontSize;
  final double itemWidth;
  final double borderRadius;
  final onTap;

  const ZYSegmentedControl({
    Key? key,
    this.titleList,
    this.selectedColor = Colors.blue,
    this.textColor= Colors.black45,
    this.selecetedTextColor = Colors.white,
    this.fontSize = 15,
    this.onTap,
    this.itemWidth = 60,
    this.borderRadius = 5})
      : super(key: key);

  @override
  _ZYSegmentedControlState createState() => _ZYSegmentedControlState();
}

class _ZYSegmentedControlState extends State<ZYSegmentedControl> {
  List<Widget> items = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (var i = 0; i < (widget.titleList ?? []).length; i++) {
      items.add(ZYSegmentedItem(
        title: (widget.titleList ?? [])[i],
        index: i,
        selectedColor: widget.selectedColor,
        textColor: widget.textColor,
        selecetedTextColor: widget.selecetedTextColor,
        selected: selectedIndex == i,
        fontSize: widget.fontSize,
        isLast: i == (widget.titleList ?? []).length - 1,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            widget.onTap(index);
          });
        },
      ));
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(width: 1, color: widget.selectedColor),
          color: Colors.white),
      child: Container(
        width: items.length * widget.itemWidth,
        child: Row(children: items),
      ),
    );
  }
}

class ZYSegmentedItem extends StatelessWidget {
  final String title;
  final int? index;
  final bool selected;
  final bool isLast;
  final Color? selectedColor;
  final Color? textColor;
  final Color? selecetedTextColor;
  final double? fontSize;
  final onTap;

  const ZYSegmentedItem(
      {Key? key,
        this.title = '',
        this.index,
        this.selected = false,
        this.isLast = false,
        this.onTap,
        this.selectedColor,
        this.textColor,
        this.selecetedTextColor,
        this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: Container(
            margin: EdgeInsets.only(),
            alignment: Alignment.center,
            height: 30,
            color: selected ? selectedColor : null,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize,color: selected?selecetedTextColor:textColor),
                  ),
                ),
                if (!isLast)
                  Container(
                    color: selectedColor,
                    width: 1,
                    height: 30,
                  )
              ],
            )),
      ),
    );
  }
}
