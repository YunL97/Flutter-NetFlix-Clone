import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacodingapple/binding/binding.dart';
import 'package:instacodingapple/controller/data_list_controller.dart';
import 'package:instacodingapple/notification.dart';
import 'package:instacodingapple/pages/mainpage.dart';
import 'package:instacodingapple/pages/profile.dart';
import 'package:instacodingapple/pages/shop.dart';
import 'package:instacodingapple/style/style.dart' as style;
import 'package:http/http.dart' as http;
import 'package:instacodingapple/pages/upload.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/tab_controller.dart';
import 'firebase_options.dart';
import 'pages/home.dart';

void main() async {
  //파이어베이스 연동 코드
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    //MaterialApp 자식 위젯들은 전부 Store1에 있던 state 사용가능
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: style.theme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyApp(), binding: BindingPages()),
        GetPage(
            name: '/upload',
            page: () => Upload(),
            binding: BindingPages(),
            transition: Transition.circularReveal),
        GetPage(
            name: '/profile', page: () => Profile(), binding: BindingPages()),
      ],
    ),
  );
}
