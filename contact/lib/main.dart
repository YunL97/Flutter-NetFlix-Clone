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
        //Scaffold
        home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.star),
              title: Text("aaa"),
            ),
            body: Container(
              width: double.infinity,
              child: ListView(

                children: [
                  Container(
                    color: Colors.grey,
                    child: Row(

                      children: [
                        Icon(Icons.star),
                        Text("aa")
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text("aa")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text("aa")
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}

//ios 클로저:? 변수에다가 담아도 되는것: 평생 바뀌지 않는것 ex)로고 상단바 하단바,    데이터가 담기는것 같은경우는 변수에 담지 않는다 성능 이슈가 날 수 있기 때문
var a = SizedBox(
  child: Text("bb")
);

class ShopItem extends StatelessWidget {
  //class에 어떤 파라미터 넣을 수 있는지 정의부분
  const ShopItem({Key? key}) : super(key: key);

  //class 안에 build 라는 함수 만드는 부분
  @override //@override : 상위 클래스 함수보다 내꺼먼저 적용하라는 뜻
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text("aa"),
    );
  }
}
