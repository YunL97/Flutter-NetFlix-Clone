import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
    //getPermission을 띄워서 두번이상 거절하면 다시는 안뜸 앱 정책임

  }

  getPermission() async{
    //Dat특징: 오래 걸리는 줄은 재껴두고 다음줄을 실행하려고함
    //await: await붙으면 다음줄 실행안하고 기다려줌, async 있어야 사용가능
    var status = await Permission.contacts.status;
    if(status.isGranted){
      print("허락됨");
    }else if (status.isDenied){
      print('거절됨');
      Permission.contacts.request();
    }
  }

  var a = 1;
  var total = 3;
  //state 수정되면 자동으로 재렌더링
  var name = ['lee','yun','sik','asd'];


  addOne() {
    setState(() {
      a++;
    });
  }

  addPerson(String namePlus) {
    setState(() {
      print(namePlus);
      name.add(namePlus);
      print(name);
    });
  }

  @override // context에는 MaterialApp 정보가 들어있음
  Widget build(BuildContext context) {
    //MaterialApp: 구글이제공하는 Material을 사용가능 but google스타일 custom 하고싶을때에도 사용가능 MeterialApp 사용안하면 코드 3배 증가
    return Scaffold(
      backgroundColor: Colors.grey,
      //버튼에는 child, onPressed 필요
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState(() {
              a++;
              showDialog(context: context, builder: (context){
                return  DialogUI(state: a, addOne:addOne, addPerson:addPerson);
              });
            });
          },
        ),
        appBar: AppBar(
          leading: Icon(Icons.star),
          title: Text(total.toString()),
          actions: [
            IconButton(onPressed: (){getPermission(); }, icon: Icon(Icons.contacts))
          ],
        ),
        body: Container(
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, i){

                return ListTile(
                  // leading: Text(like[i].toString()),
                  leading: Icon(Icons.home),
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
  DialogUI({Key? key , this.state, this.addOne, this.addPerson}) : super(key: key);
  var state;
  var addOne;
  var addPerson;
  var inputData = TextEditingController();

  //{} Map
  var inputData2 = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('contact'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(onChanged: (text){
              inputData2 = text;

            },)
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: (){
          addOne();
          addPerson(inputData2);
          Navigator.of(context).pop();
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