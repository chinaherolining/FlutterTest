import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/AdBanner.dart';
import 'widget/LeaderPhone.dart';
import 'widget/Recommend.dart';
import 'widget/FloorTitle.dart';
import 'widget/FloorContent.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  String homePageContent ='正在获取数据';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('1111111');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('百姓生活+')),
      body:FutureBuilder(
            future: getHomePageContent(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                //处理数据
                var data = json.decode(snapshot.data.toString());
                List<Map> swiper = (data['data']['slides'] as List).cast();
                List<Map> navigatorList = (data['data']['category'] as List).cast();
                String adPicture = data['data']['advertesPicture']['PICTURE_ADDRESS'];
                String leaderImage = data['data']['shopInfo']['leaderImage'];
                String leaderPhone = data['data']['shopInfo']['leaderPhone'];
                List<Map> recommendList = (data['data']['recommend'] as List).cast();
                String floor1Title = data['data']['floor1Pic']['PICTURE_ADDRESS'];
                String floor2Title = data['data']['floor2Pic']['PICTURE_ADDRESS'];
                String floor3Title = data['data']['floor3Pic']['PICTURE_ADDRESS'];
                List<Map> floor1 = (data['data']['floor1'] as List).cast();
                List<Map> floor2 = (data['data']['floor2'] as List).cast();
                List<Map> floor3 = (data['data']['floor3'] as List).cast();

                return SingleChildScrollView(
                    child:Column(
                  children: <Widget>[
                    SwiperDiy(swiperDateList: swiper),
                    TopNavigator(navigatorList:navigatorList),
                    AdBanner(adPicture: adPicture),
                    LeaderPhone(leaderImage: leaderImage,leaderPhone:leaderPhone),
                    Recommend(recommendList:recommendList),
                    FloorTitle(picture_address: floor1Title,),
                    FloorContent(floorGoodsList:floor1),
                    FloorTitle(picture_address: floor2Title,),
                    FloorContent(floorGoodsList:floor2),
                    FloorTitle(picture_address: floor3Title,),
                    FloorContent(floorGoodsList:floor3),
                  ],
                  )
                );
              }else{
                return Center(
                  child: Text('加载中。。。。。'),
                );
              }
            }),
    );
  }


}
//首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;
  SwiperDiy({Key key,this.swiperDateList});

  @override
  Widget build(BuildContext context) {

//    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
//    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
//    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    return Container(
      height: ScreenUtil().setHeight(333),
      // ignore: argument_type_not_assignable
      width: ScreenUtil().setWidth(720),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDateList[index]['image']}");
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key,this.navigatorList}):super(key:key);
  Widget _gridViewItemUI(BuildContext contex,item){
    return InkWell(
      onTap: (){print('点击了导航');},
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    if(this.navigatorList.length > 10){
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context,item);
        }).toList(),
      )
    );
  }
}
