

import 'package:flutter/material.dart';
import 'package:instaclone/src/compornents/image_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 뒤로가기 눌렀을때 발생하는 이벤트
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          label: "home",
          icon: ImageData('assets/images/bottom_nav_home_off_icon.jpg'),
        ),
        BottomNavigationBarItem(
            label: "home",
          icon: ImageData('bottom_nav_home_off_icon.jpg'),
        )
      ],),
    ), onWillPop: () async{
      print("aa");


      //false": 뒤로가기 눌러도 그 페이지를 닫지 않겠다.
      return false;

    });
  }
}
