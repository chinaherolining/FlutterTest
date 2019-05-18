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
import 'widget/HotGoods.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../routers/application.dart';

class HomePage extends StatefulWidget{
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  String homePageContent ='正在获取数据';

  int page = 1;
  List<Map> hotGoodsList=[];
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _getHotGoods();
  }

  @override
  Widget build(BuildContext context){
    var formData = {'lon':'115.02932','lat':'35.76189'};
    return Scaffold(
      appBar: AppBar(title:Text('百姓生活+')),
      body:FutureBuilder(
            future: request('homePageContent', formData:formData),
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

                return EasyRefresh(
                    refreshFooter: ClassicsFooter(
                      key: _footerKey,
                      bgColor: Colors.white,
                      textColor: Colors.pink,
                      moreInfoColor: Colors.pink,
                      showMore: true,
                      noMoreText: '',
                      moreInfo: '加载中',
                      loadedText: '上拉加载',
                    ),
                    child:ListView(
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
                      _hotGoods(),
//                      HotGoods(),
                  ],
                  ),
                  loadMore: ()async{
                    print('开始加载更多00---');
                    var formPage = {'page':page};
                    await request('homePageBelowConten',formData: formPage).then((val){
                      var data = json.decode(val.toString());
                      List<Map> newGoodsList = (data['data'] as List).cast();
                      setState(() {
                        hotGoodsList.addAll(newGoodsList);
                        page++;
                      });
                    });
                  },
                );
              }else{
                return Center(
                  child: Text('加载中。。。。。'),
                );
              }
            }),
    );
  }

  void _getHotGoods(){
    var formPage = {'page':page};
    request('homePageBelowConten',formData: formPage).then((val){
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }
  //标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top:10.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

  Widget _wrapList(){
    if(hotGoodsList.length != 0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          onTap: (){
            Application.router.navigateTo(context, "/detail?id=${val['goodsId']}");
          },
          child: Container(
            width: ScreenUtil().setWidth(352),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['image'],width: ScreenUtil().setWidth(352),),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text('￥${val['price']}',style: TextStyle(color: Colors.black26,decoration:TextDecoration.lineThrough))
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    }else{
      return Text('');
    }
  }

  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList()
        ],
      ),
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
          return InkWell(
            onTap: (){
              Application.router.navigateTo(context, "/detail?id=${swiperDateList[index]['goodsId']}");
            },
            child: Image.network("${swiperDateList[index]['image']}"),
          );

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
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context,item);
        }).toList(),
      )
    );
  }


}
