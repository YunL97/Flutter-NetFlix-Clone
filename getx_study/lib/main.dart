import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/binding/binding_page.dart';
import 'package:getx_study/src/controller/count_controller_with_getx.dart';
import 'package:getx_study/src/controller/dependency_controller.dart';
import 'package:getx_study/src/home.dart';
import 'package:getx_study/src/pages/binding.dart';
import 'package:getx_study/src/pages/named/first.dart';
import 'package:getx_study/src/pages/named/second.dart';
import 'package:getx_study/src/pages/next.dart';
import 'package:getx_study/src/pages/testpage.dart';
import 'package:getx_study/src/pages/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter Demo1",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Home(),
      initialRoute: "/",
      // routes: {
      //   "/": (context) => Home(),
      //   "/first": (context) => FirstNamedPage(),
      //   "/second": (context) => SecondNamedPage(),
      // },

      //getX 라우트 사용법
      getPages: [
        //함수 선언으로 가는법: ctrl + b
        GetPage(name: "/", page: () => Home(), transition: Transition.zoom),
        GetPage(
            name: "/first",
            page: () => FirstNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/second",
            page: () => SecondNamedPage(),
            transition: Transition.zoom),
        GetPage(
            name: "/next", page: () => NextPage(), transition: Transition.zoom),
        GetPage(
            name: "/user/:uid",
            page: () => UserPage(),
            transition: Transition.cupertino),
        GetPage(
            name: "/binding",
            page: () => BindingPage(),
            binding: BindingPageBinding(),
            transition: Transition.circularReveal),
        GetPage(name: "/testpage", page: () => Test()),
      ],
    );
  }
}
