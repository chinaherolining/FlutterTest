
import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategroyList = [];
  int childIndex = 0;//子类高亮索引
  String categoryId = '4';//大类ID
  String subId = '';//小类ID
  int page = 1;//列表页数
  String noMoreText = '';//显示没有数据的提示
  //大类切换
  getChildCategory(List<BxMallSubDto> list,String id){
    noMoreText = '';
    page = 1;
    categoryId = id;
    childIndex = 0;
    BxMallSubDto all = new BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.comments = 'null';
    all.mallSubName = '全部';
    childCategroyList = [all];
    childCategroyList.addAll(list);
    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(index,String id){
    noMoreText = '';
    page = 1;
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  //增加page的方法
  addPage(){
    page++;
  }
  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}