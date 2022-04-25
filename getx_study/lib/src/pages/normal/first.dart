import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/normal/second.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("first page"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));
            Get.to(SecondPage());
          },
              child: Text("다음페이지 이동1"))
        ],
      ),
      ),
    );
  }
}
