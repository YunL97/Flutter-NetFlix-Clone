import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);


  //스크롤 관련 데이터들 바로바로 저장됨
  var scroll = ScrollController();





  @override
  Widget build(BuildContext context) {

    if (data.isNotEmpty) {
      return Container(
          child: ListView.builder(
            controller: scroll,
            itemCount: data.length,
            itemBuilder: (context, i) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image(image: AssetImage("assets/images/download.jpg"), fit: BoxFit.fitWidth),
                    data[i]['image'].runtimeType == String ? Image.network(data[i]['image']) : Image.file(data[i]['image']),
                    GestureDetector(
                      child: Text(data[i]['user']),
                      onTap: () {
                       Get.toNamed('/profile');
                      },
                    )
                    ,
                    Text(data[i]['likes'].toString()),
                    Text(data[i]['content'])
                  ]
              );
              print("a");
            },
          )
      );
    }else {
      return Text("로딩중");
    }
  }
}



class Store2 extends ChangeNotifier {

}



