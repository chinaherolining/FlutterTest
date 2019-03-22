import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//楼层标题
class FloorTitle extends StatelessWidget {
  final String  picture_address ;//图片地址

  FloorTitle({Key key,this.picture_address}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }


}
