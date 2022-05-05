import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListController extends GetxController {
  RxList data = [].obs;
  var userImage;
  var userContent;
  var scroll = ScrollController();

  //처음시작할때 데이터 가져오기
  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if (result.statusCode == 200) {
    } else {}
    var result2 = jsonDecode(result.body);
    data(result2);
    update();
  }

  //엄로드 그림
  addMyData() {
    var myData = {
      'id': data.length,
      'image': userImage,
      'like': 5,
      'date': 'July 25',
      'content': '등을대라',
      'liked': false,
      'user': 'lee',
    };
    data.insert(0, myData);
  }

  //api로 가져온 데이터, 마지막 list에 넣기
  addData(a) {
    data.add(a);
  }

  //api로 데이터 가져오기
  getMore() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    addData(result2);
    print("aa");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("데이터가져오기");
    getData();

    //스크롤 마지막 갔을 때 데이터 가져오기
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        // print("같음");
        getMore();
      }
    });
    update();
  }
}
