import 'package:get/get.dart';

class Test1Controller extends GetxController {
  RxInt a = 1.obs;

  void increase() {
    a++;
  }
}
