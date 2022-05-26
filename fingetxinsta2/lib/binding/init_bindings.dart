import 'package:fingetxinsta/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/home_controller.dart';
import '../controller/mypage_controller.dart';
import '../controller/upload_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }

  static additionalBinding() {
    Get.put(MyPageController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
