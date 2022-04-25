import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/home.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("next page"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${(Get.arguments as User).name}, ${(Get.arguments as User).age}"),
          ElevatedButton(onPressed: (){
            //일반적인 getX 사용하지 않은 다른페이지 띄우기
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage(),));
            Get.back();
          },
              child: Text("뒤로 이동")),
          SizedBox(height: 30,),

        ],
      ),
      ),
    );
  }
}
