import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/dependencys/dependency_manage_page.dart';
import 'package:getx_study/src/pages/normal/first.dart';
import 'package:getx_study/src/pages/reactive_state_manage_page.dart';
import 'package:getx_study/src/pages/simple_state_manage_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("라우트관리 홈"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));
            Get.to(FirstPage());
          },
              child: Text("일반적인 라우트1")),

          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));

            //url 이용해서 라우트 움직일때 사용
            Get.toNamed("/first");
          },
              child: Text("Named 라우트")),

          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));

            //url 이용해서 라우트 움직일때 사용
            Get.toNamed("/next",arguments: User("lee", 26));
          },
              child: Text("arguments 전달")),

          ElevatedButton(onPressed: (){
            Get.to(SimpleStateManagePage());
          },

              child: Text("단순 상태관리")),

          ElevatedButton(onPressed: (){
            Get.to(ReactiveStateManagePage());
          },

              child: Text("반응형 상태관리")),

          ElevatedButton(onPressed: (){
            Get.to(DependencyManagePage());
          },

              child: Text("의존성 관리")),

          ElevatedButton(onPressed: (){
            Get.to(DependencyManagePage());
          },

              child: Text("의존성 관리")),


        ElevatedButton(onPressed: (){
          Get.toNamed('/binding');
        },

            child: Text("바인딩")),
        ],
      ),
      ),
    );
  }
}

class User{
  String name;
  int age;
  User(this.name, this.age);
  
}
