import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/pages/normal/second.dart';

// file 이름이 : ---- 주소로나옴
class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("first named page"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));
            // Get.toNamed('/second');

            //넘어가면서 first 메모리 없앰
            Get.offNamed('/second');
          },
              child: Text("다음페이지 이동"))
        ],
      ),
      ),
    );
  }
}
