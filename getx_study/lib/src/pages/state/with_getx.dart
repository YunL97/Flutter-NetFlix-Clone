import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/controller/count_controller_with_getx.dart';

//
class WithGetX extends StatelessWidget {
  const WithGetX({Key? key}) : super(key: key);

  Widget _button( {required String id}) {
    return ElevatedButton(onPressed: (){
      Get.find<CountControllerWithGetx>().increase(id);
    },
      child: Text("+", style: TextStyle(fontSize: 30),),);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("GetX", style: TextStyle(fontSize: 30),),
          GetBuilder<CountControllerWithGetx>(
            id: "first",
            builder: (controller) {
            return Text("${controller.count}", style: TextStyle(fontSize: 30),);
          }, ),
          GetBuilder<CountControllerWithGetx>(
            id: "second",
            builder: (controller) {
            return Text("${controller.count}", style: TextStyle(fontSize: 30),);
          }, ),
         _button(id: "first"),
          _button(id: "second"),


        ],
      ),
    );
  }
}
