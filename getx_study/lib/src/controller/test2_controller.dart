import 'package:get/get.dart';

class Test2Controller extends GetxController {
  RxInt a = 1.obs;

  void increase() {
    a++;
  }
}
