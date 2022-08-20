import 'package:flutter/material.dart';
import 'package:flutter_application_1/macro/global.dart';


typedef IndexCallback = void Function(int index);

class LuShotRankingPointCell extends StatelessWidget {
  // final Video model;
  // final IndexCallback onTap;
  // final int index;
  // final QZADModel? adsModel;
  // final int? showRangking;
  //
  // LuShotRankingPointCell(this.model,this.index,this.onTap,{this.adsModel,this.showRangking});
  LuShotRankingPointCell();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(padding: EdgeInsets.fromLTRB(8, 23, 8, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 4)),
                  Image.asset(
                    prefix_image('home.png'),
                    fit: BoxFit.cover,
                    width: 16,
                    height: 16,
                  ),
                  Padding(padding: EdgeInsets.only(left: 6)),
                  Text(
                    '24:60:59',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Text(
                '决战紫禁之巅，决战紫禁之紫禁之巅决战紫禁之巅决战决战紫禁之紫禁之巅决战紫禁之紫禁之巅决战紫禁之紫禁决战紫禁...，.',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff999999),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Row(
                children: [
                  Text(
                    '山下惠子',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff999999),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    prefix_image('home.png'),
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                  Expanded(child: Container(),),
                  Container(
                    child: Row(
                      children: [
                        _initImageWithNumber(),
                        _initImageWithNumber(),
                        _initImageWithNumber(),
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }

  _initImageWithNumber() {
    return Row(
      children: [
        Image.asset(
          prefix_image('home.png'),
          fit: BoxFit.cover,
          width: 30,
          height: 30,
        ),
        Text(
          '12',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
