import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/data_list_controller.dart';
import '../controller/tab_controller.dart';
import 'home.dart';
import 'shop.dart';

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
        return [Home(), Shop()][_.tab.value];
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
