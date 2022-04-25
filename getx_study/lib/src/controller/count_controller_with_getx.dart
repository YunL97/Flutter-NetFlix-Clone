
import 'package:get/get.dart';

class CountControllerWithGetx extends GetxController {

   //<> 꺽쇠 쓰기 귀찮을때 사용
  //static CountControllerWithGetx get to => Get.find();
 //Get.find<CountControllerWithGetx>().increase();
  // -> CountControllerWithGetx.to.increase();
  int count = 0;




    void increase([String? id]){
      count++;
      print("aa");
      if (id != null) {
      update(["${id}"]);
      }else {
        update();
      }
    }


  }
