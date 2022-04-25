import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("second page"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));
            Get.back();
          },
              child: Text("뒤로 이동")),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));
            // Get.to(Home());
            //쌓인 리소스 다없앤다
            Get.offAll(Home());
          },
              child: Text("홈으로 이동")),
        ],
      ),
      ),
    );
  }
}
