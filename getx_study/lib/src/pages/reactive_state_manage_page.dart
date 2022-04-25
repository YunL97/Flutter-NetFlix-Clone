import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/controller/count_controller_with_getx.dart';
import 'package:getx_study/src/controller/count_controller_with_provider.dart';
import 'package:getx_study/src/controller/count_controller_with_reactive.dart';
import 'package:getx_study/src/home.dart';
import 'package:getx_study/src/pages/state/with_getx.dart';
import 'package:getx_study/src/pages/state/with_provider.dart';
import 'package:provider/provider.dart';

class ReactiveStateManagePage extends StatelessWidget {
  const ReactiveStateManagePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //페이지 안에 get.put을 해서 결합도가 낮아지고 응집도가 높아짐
    Get.put(CountControllerWithRecative());
     return Scaffold(
      appBar: AppBar(title: Text("반응형상태관리1"),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GetX", style: TextStyle(fontSize: 30),),
         GetX<CountControllerWithRecative>(
             builder: (_) {
           return Text(
             "${_.count.value}");
         }),
         
         //변화를 감지 했을 때 바로 Obx 에서 업데이트를 날려준다.
          //Obx 를 사용하려면 반드시 옵저벌브를 사용한 그 값을 안에 넣어줘야함
          // Obx(() => Text("${Get.find<CountControllerWithRecative>().count.value}", style: TextStyle(fontSize: 30),),),
          ElevatedButton(onPressed: (){Get.find<CountControllerWithRecative>().increase();},
          child: Text("+", style: TextStyle(fontSize: 30),),
      ),
          ElevatedButton(onPressed: (){Get.find<CountControllerWithRecative>().putNumber(5);},
            child: Text("5로 변경", style: TextStyle(fontSize: 50),),
          ),
        ],
        ),
      )
     );
  }
}


