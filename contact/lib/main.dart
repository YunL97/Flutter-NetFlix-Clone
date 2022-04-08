import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stless 탭
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //MaterialApp: 구글이제공하는 Material을 사용가능 but google스타일 custom 하고싶을때에도 사용가능 MeterialApp 사용안하면 코드 3배 증가
   return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          title: Text("앱임"),
        ),
        body: Container(child: Text('test'),),
        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Icon(Icons.add_alert),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
        ),
      )
    );
  }
}

