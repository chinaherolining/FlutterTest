import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../service/service_method.dart';
//火爆商品
class HotGoods extends StatefulWidget {


_HotGoodsState createState() =>_HotGoodsState();


}
class _HotGoodsState extends State<HotGoods>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    request('homePageBelowConten', 1).then((val){
      print(val);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('李宁'),
    );
  }
}