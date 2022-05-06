import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacodingapple/binding/binding.dart';
import 'package:instacodingapple/controller/data_list_controller.dart';
import 'package:instacodingapple/notification.dart';
import 'package:instacodingapple/pages/profile.dart';
import 'package:instacodingapple/pages/shop.dart';
import 'package:instacodingapple/style/style.dart' as style;
import 'package:http/http.dart' as http;
import 'package:instacodingapple/pages/upload.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/tab_controller.dart';
import 'firebase_options.dart';
import 'pages/home.dart';

void main() async {
  //파이어베이스 연동 코드
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    //MaterialApp 자식 위젯들은 전부 Store1에 있던 state 사용가능
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: style.theme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyApp(),binding: BindingPages()),
        GetPage(name: '/upload', page: () => Upload(),binding: BindingPages(), transition: Transition.circularReveal),
        GetPage(name: '/profile', page: () => Profile(),binding: BindingPages() ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //반응형 디자인 현재 페이지의 가로를 알려주는 코드
    MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () async {
              //선택화면 띄우는법법
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                Get.find<ListController>().userImage = File(image.path);
              } else {
                return Get.toNamed('/');
              }
              return Get.toNamed('/upload');
            },
            iconSize: 30,
          ),
          Text(
            "da",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      // 원하는 ThemeData안의 내용을 불러옴
      body: GetX<BottomTabController>(builder: (_) {
        return [
          Home(), Shop()]
        [_.tab.value];
      }),





      // Text("안녕하세요", style: Theme.of(context).textTheme.bodyText2,),
      bottomNavigationBar: GetX<BottomTabController>(builder: (_) {
        return BottomNavigationBar(
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(.60),
          currentIndex: _.tab.value,
          onTap: (i) {
            if (i == 0) {
              _.tab.value = 0;
            } else {
              _.tab.value = 1;
              print("asd");
            }
          },
          items: [
            BottomNavigationBarItem(
                label: "홈",
                icon: Icon(
                  Icons.home_outlined,
                )),
            BottomNavigationBarItem(
                label: "샵", icon: Icon(Icons.shopping_bag_outlined)),
          ],
        );
      }),
    );
  }
}
