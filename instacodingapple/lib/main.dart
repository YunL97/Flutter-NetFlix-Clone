import 'package:flutter/material.dart';
import 'package:instacodingapple/style.dart' as style;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [Icon(Icons.add_box_outlined,),Text("da", style: TextStyle(color: Colors.white),) ],),
                                  // 원하는 ThemeData안의 내용을 불러옴
      body: [
        Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context,i){
           return Column(
              children: [
                Text("aa"),
                Image(image: AssetImage("images/download.jpg"))
              ]
            );
          print("a");
          },
        )
        ),
      Text('샵페이지')][tab],
          
      // Text("안녕하세요", style: Theme.of(context).textTheme.bodyText2,),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
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
            icon:Icon(Icons.home_outlined, color: Colors.black,)
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
