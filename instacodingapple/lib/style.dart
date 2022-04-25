

import 'package:flutter/material.dart';

var theme = ThemeData(
   //  textButtonTheme: TextButtonThemeData(
   //      style: TextButton.styleFrom(
   //          backgroundColor: Colors.grey,
   //      )
   //  ),
   //  elevatedButtonTheme: (
   //
   // ),
  //모든 아이콘이 파래짐
    iconTheme: IconThemeData(color: Colors.black),
    //복잡한 위젯은 복잡한 위젯 theme안에서 스타일 줘야함
    appBarTheme: AppBarTheme(
        color:Colors.white,
        //그림자
        elevation: 1,

        //actions:[] 안의 아이콘 테마 결정 가능
        actionsIconTheme: IconThemeData(color: Colors.black, size: 30, ),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30, fontStyle: FontStyle.normal)

    ),
    textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.red),
        bodyText1: TextStyle(color: Colors.blue)
    ),
    bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.black
    )
);