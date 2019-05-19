import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        body:ListView(
          children: <Widget>[
            _topHeader(),
          ],
        )
    );
  }

  //头部
  Widget _topHeader(){
    return Container(
      width: ScreenUtil().setWidth(700),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network('http://blogimages.jspang.com/blogtouxiang1.jpg')
                ,
            ),
          ),
          Container(
            margin: EdgeInsets.only(),
            child: Text(
                '李宁',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  color: Colors.black54
                ),
            ),
          )
        ],
      ),
    );
  }
}