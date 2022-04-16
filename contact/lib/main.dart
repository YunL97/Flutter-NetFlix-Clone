import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp())
    );

}

//stful 탭
class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var total = 3;
  var name = ['lee','yun','sik'];
  var like = [0,0,0];
  @override // context에는 MaterialApp 정보가 들어있음
  Widget build(BuildContext context) {
    //MaterialApp: 구글이제공하는 Material을 사용가능 but google스타일 custom 하고싶을때에도 사용가능 MeterialApp 사용안하면 코드 3배 증가
    return Scaffold(
          //버튼에는 child, onPressed 필요
          floatingActionButton: FloatingActionButton(
            child: Text(a.toString()),
            onPressed: (){
              setState(() {
                a++;
                showDialog(context: context, builder: (context){
                    return  DialogUI(state: a);
                });
              });
            },
          ),
            appBar: AppBar(
              leading: Icon(Icons.star),
              title: Text(total.toString()),
            ),
            body: Container(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, i){

                    return ListTile(
                      leading: Text(like[i].toString()),
                      title: Text(name[i]),
                    );
                  },
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

class DialogUI extends StatelessWidget {
   DialogUI({Key? key , this.state}) : super(key: key);
  var state;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('contact'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField()
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: (){

        },
            child: Text(state.toString())
        ),
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("취소"))
      ],
    );
  }
}
