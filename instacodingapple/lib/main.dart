import 'package:flutter/material.dart';
import 'package:instacodingapple/style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: style.theme,
        home: MyApp(),
      ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    if (result.statusCode == 200) {

    }else {

    }
    var result2 = jsonDecode(result.body);
    // print(result2[0]['likes']);
    setState(() {
      data = result2;
    });

    // print(result2[0]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [Icon(Icons.add_box_outlined,),Text("da", style: TextStyle(color: Colors.white),) ],),
                                  // 원하는 ThemeData안의 내용을 불러옴
      body: [
        Home(data: data),
      Text('샵페이지')][tab],
          
      // Text("안녕하세요", style: Theme.of(context).textTheme.bodyText2,),
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        currentIndex: tab,
        onTap: (i){
          if (i == 0) {
            setState(() {
              tab =0;

            });
          }else {
            setState(() {
              tab =1;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              label:  "홈",
            icon:Icon(Icons.home_outlined,)
          ),
          BottomNavigationBarItem(
              label:  "샵",
              icon:Icon(Icons.shopping_bag_outlined)
          ),
        ],
      ),
    );
  }
}
