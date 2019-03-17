import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AdBanner extends StatelessWidget {
  final String adPicture;
  AdBanner({Key key,this.adPicture}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}
