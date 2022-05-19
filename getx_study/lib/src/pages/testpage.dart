import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_study/src/controller/test2_controller.dart';
import 'package:getx_study/src/controller/test_controller.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller1 = Get.put(Test1Controller());
    final controller2 = Get.put(Test2Controller());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(() => Text('${controller1.a.value}')),
          Obx(() => Text('${controller2.a.value}')),
          ElevatedButton(
              onPressed: () {
                controller1.increase();
              },
              child: Text('1')),
          ElevatedButton(
              onPressed: () {
                controller2.increase();
              },
              child: Text('2'))
        ],
      ),
    );
  }
}
