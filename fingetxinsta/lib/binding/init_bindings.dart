import 'package:fingetxinsta/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
