import 'package:fingetxinsta/controller/auth_controller.dart';
import 'package:fingetxinsta/pages/login.dart';
import 'package:fingetxinsta/pages/signup_page.dart';
import 'package:fingetxinsta/src/app.dart';
import 'package:fingetxinsta/src/models/instagram_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetView<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        //유저 데이터 가져옴
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext _, AsyncSnapshot<User?> user) {
          //데이터 있으면
          if (user.hasData) {
            //내부 파이어베이스 유저정보를 조회 with user.data.uid
            return FutureBuilder<IUser?>(
                future: controller.loginUser(user.data!.uid),
                //future IUser데이터가 snapshot로 들어감
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const App();
                  } else {
                    return Obx(
                      () => controller.user.value.uid != null
                          ? const App()
                          : SignupPage(uid: user.data!.uid),
                    );
                  }
                });
          } else {
            return const Login();
          }
          return Container();
        });
  }
}

// FutureBuilder: 이미지가져오기, 배터리표시, 파일가져오기, http요청등 일회성 응답에 사용
// StreamBuilder: 위치 업데이트, 음악재생, 스톱워치 일부 데이터를 여러번 가져올때 사용
