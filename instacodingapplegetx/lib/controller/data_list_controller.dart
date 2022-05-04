
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ListController extends GetxController {


  RxList data = [].obs;
  var userImage;
  var userContent;
  var scroll = ScrollController();


  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    if (result.statusCode == 200) {

    }else {

    }
    var result2 = jsonDecode(result.body);
    // print(result2[0]['likes']);
    // setState(() {
    // data = result2;
    // });

    // print(result2[0]);
  }


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

  getMore() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    addData(result2);
    print("aa");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent){
        // print("같음");
        getMore();
      }
    });


  }

}