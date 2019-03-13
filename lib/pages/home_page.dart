import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{
  String showText = "还没有数据";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('请求远程数据'),),
          body:SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[


                    RaisedButton(
                      onPressed:_jike,
                      child: Text('请求数据'),
                    ),
                    Text(
                      showText
                    ),
                  ],
                ),
              )
          )
      ),
    );
  }
  void _jike(){
    print("开始请求-----");
    getHttp().then((val){
      setState(() {
        showText=val['data'].toString();
      });
    });
  }
  Future getHttp() async{
    try{

      Response response;
      Dio dio = new Dio();
      dio.options.headers=httpHeaders;
      response = await Dio().get("https://time.geekbang.org/serv/v1/column/newAll");
      return response.data;
    }catch(e){
      return print(e);
    }
  }
}

//class HomePage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context){
//    getHttp();
//    return Scaffold(
//        body:Center(
//          child: Text('商城首页'),
//        )
//    );
//  }
//  void getHttp() async{
//    try{
//      Response response;
//      response = await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=小姐姐");
//      return print(response);
//    }catch(e){
//      return print(e);
//    }
//  }
//}