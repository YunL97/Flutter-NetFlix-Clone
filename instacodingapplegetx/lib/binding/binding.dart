import 'package:get/get.dart';

import '../controller/data_list_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/tab_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ListController());
    Get.put(ProfileController());
    Get.put(BottomTabController());
  }
}
