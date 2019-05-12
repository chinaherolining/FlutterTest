
import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategroyList = [];
  int childIndex = 0;//子类高亮索引
  String categoryId = '4';//大类ID
  String subId = '';//小类ID
  //大类切换
  getChildCategory(List<BxMallSubDto> list,String id){
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
    childIndex = index;
    subId = id;
    notifyListeners();
  }
}