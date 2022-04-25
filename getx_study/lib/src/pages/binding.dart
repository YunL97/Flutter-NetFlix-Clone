import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/controller/count_controller_with_getx.dart';

class BindingPage extends StatelessWidget {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<CountControllerWithGetx>(builder: (_){
            return Text(_.count.toString());
          }),
          ElevatedButton(onPressed: (){
            Get.find<CountControllerWithGetx>().increase();
          }, child: Text(""),),
        ],
      ),
    );
  }
}
