import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList ;//商品列表

  FloorContent({Key key,this.floorGoodsList}):super(key:key);
  Widget _goodsItem(Map goods){
    return Container(
      width: ScreenUtil().setWidth(352),
      child: InkWell(
        onTap: (){print('点击了楼层商品');},
        child:Image.network(goods['image']),
      ),
    );
  }
  Widget _firstRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }
  Widget _otherRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            _firstRow(),
            _otherRow()
          ],
      ),
    );
  }


}
