import 'package:fingetxinsta/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../src/models/instagram_user.dart';

class MyPageController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  Rx<IUser> targetUser = IUser().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  void setTargetUser() {
    var uid = Get.parameters['targetUid'];
    if (uid == null) {
      //여기서 user데이터를 넣기전에 바인딩하기때문에 null이 된다.
      //그래서  authcontroller에서 user(userdata)를 먼저해줘야한다.
      targetUser(AuthController.to.user.value);
    } else {
      //싱데 uid로 users collection 조회
    }
  }

  void _loadData() {
    setTargetUser();

    //포스트리스트 로드
    //사용자정보로드
  }
}
