import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _selectAllBtn(),
          _allPriceArea(),
          _goButton()
        ],
      ),

    );
  }

  //全选按钮
  Widget _selectAllBtn(){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value:true,
            activeColor: Colors.pink,
            onChanged: (bool val){},
          ),
          Text('全选')
        ],
      ),
    );
  }
  //合计
  Widget _allPriceArea(){
    return Container(
      width: ScreenUtil().setWidth(400),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(250),
                child: Text(
                    '合计:',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(36)
                    ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '1992:',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      color: Colors.red
                  ),
                ),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(400),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                  color: Colors.black38
              ),
            ),
          )
        ],
      ),
    );
  }

  //结算按钮
  Widget _goButton(){
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0),

          ),
          child: Text(
              '结算(6)',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
