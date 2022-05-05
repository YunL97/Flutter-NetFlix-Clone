import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:instacodingapple/controller/data_list_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  //스크롤 관련 데이터들 바로바로 저장됨

  @override
  Widget build(BuildContext context) {
    // Get.put(ListController());

    return GetX<ListController>(builder: (_) {
      if (_.data.isNotEmpty) {
        return Container(
            child: ListView.builder(
          controller: _.scroll,
          itemCount: _.data.length,
          itemBuilder: (context, i) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image(image: AssetImage("assets/images/download.jpg"), fit: BoxFit.fitWidth),
                  _.data[i]['image'].runtimeType == String
                      ? Image.network(_.data[i]['image'])
                      : Image.file(_.data[i]['image']),
                  GestureDetector(
                    child: Text(_.data[i]['user']),
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                  ),
                  Text(_.data[i]['likes'].toString()),
                  Text(_.data[i]['content'])
                ]);
            print("a");
          },
        ));
      } else {
        return Text("로딩중");
      }
    });
  }
}

class Store2 extends ChangeNotifier {}
