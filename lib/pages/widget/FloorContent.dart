import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routers/application.dart';
//楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList ;//商品列表

  FloorContent({Key key,this.floorGoodsList}):super(key:key);
  Widget _goodsItem(BuildContext context,Map goods){
    return Container(
      width: ScreenUtil().setWidth(352),
      child: InkWell(
        onTap: (){
          Application.router.navigateTo(context, "/detail?id=${goods['goodsId']}");
          print('点击了楼层商品');
          },
        child:Image.network(goods['image']),
      ),
    );
  }
  Widget _firstRow(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(context,floorGoodsList[1]),
            _goodsItem(context,floorGoodsList[2]),
          ],
        )
      ],
    );
  }
  Widget _otherRow(BuildContext context){
    return Row(
      children: <Widget>[
        _goodsItem(context,floorGoodsList[3]),
        _goodsItem(context,floorGoodsList[4])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            _firstRow(context),
            _otherRow(context)
          ],
      ),
    );
  }


}
