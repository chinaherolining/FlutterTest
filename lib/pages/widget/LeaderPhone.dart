import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage;//店长图片
  final String leaderPhone;//店长电话

  LeaderPhone({Key key,this.leaderImage,this.leaderPhone}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launcherURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launcherURL() async{
    String url = 'tel:'+leaderPhone;
//    const url = 'https://flutter.io';
print(url);
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'RUL 不能访问，异常';
    }
  }
}
