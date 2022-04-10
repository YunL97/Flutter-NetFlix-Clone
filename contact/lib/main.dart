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
          leading: Icon(Icons.star), title: Text("aaa"),
        ),
        body: Container(
          // child: Container(
            // width:double.infinity, height: 50,color: Colors.blue,
            // margin: EdgeInsets.all(20),
            // // padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            //border같은 잡다한 설정 넣을때 decoration사용용          // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.black)
            // ),
            // child: Text('test',
            //     style: TextStyle(backgroundColor: Colors.red, fontWeight: FontWeight.w700)
            // ),
          // child: ElevatedButton(child: Text('button'),
          //   onPressed: (){},
          //   style: ButtonStyle(alignment: Alignment.bottomCenter),
          height: 150 ,
           padding: EdgeInsets.all(20),
           child: Row(
             children: [
               Image.asset("du.jpg", width: 150,),
               Container(
                 width: 300,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("aaaaaaaaaaa",),
                     Text("aaaaa"),
                     Text("aaaaa"),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Icon(Icons.favorite),
                         Text('4')
                       ],
                     )
                   ],
                 ),
               )
             ],
           ),
        ),



        bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.add_alert),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
            ),
        ),
      )
    );
  }
}

