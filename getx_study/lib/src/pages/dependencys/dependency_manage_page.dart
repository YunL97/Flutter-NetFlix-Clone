import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_study/src/controller/dependency_controller.dart';
import 'package:getx_study/src/pages/dependencys/get_lazyput.dart';
import 'package:getx_study/src/pages/dependencys/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title:  Text("의존성 주입"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Get.to(
              //클래스 인스턴스 바로생성 하고 페이지 나갈때 memory 없애준다.
              GetPut(),
              binding: BindingsBuilder((){
                
                //넘어가는 페이지 상위에서 put을 해주기때문에 의존성 주입이되서 결합도가 높아지고 응집도가 줄어듬
                Get.put(DependencyController());
              }),
            );
          }, child: Text("Getput")),
          ElevatedButton(onPressed: (){
            Get.to(
              //클래스 인스턴스 바로생성하지않고 사용할때 인스턴스를 만들어준다
                GetLazyPut(),
                binding: BindingsBuilder((){
                  Get.lazyPut<DependencyController>(() => DependencyController());
                }),
            );},
              child: Text("Get.lazyPutt")),
          ElevatedButton(onPressed: (){
            Get.to(
              GetPut(),
              binding: BindingsBuilder((){
                Get.putAsync<DependencyController>(
                        () async{
                          await Future.delayed(Duration(seconds: 5));
                          return DependencyController();
                });
              }),
            );
          }, child: Text("Get .putAsync")),
          ElevatedButton(onPressed: (){
            Get.to(
              GetPut(),
              binding: BindingsBuilder((){
                //호출할때마나 인스턴스 계속 생성됨
                Get.create<DependencyController>(
                    () => DependencyController());
                    })
            );
          }, child: Text("get create")),
        ],
      ),
    ),
    );
  }
}
