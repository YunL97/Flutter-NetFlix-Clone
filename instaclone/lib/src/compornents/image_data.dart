
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {

  ImageData(this.icon, {Key? key, this.width = 55}) : super(key: key);
  String icon;
  final double? width;
  @override
  Widget build(BuildContext context) {
    //
    return Image.asset(icon, width: width! / Get.mediaQuery.devicePixelRatio,);
  }
}

class IconsPath{
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.jpg';
  static String get homOn => 'assets/images/bottom_nav_home_on_icon.jpg';
}
