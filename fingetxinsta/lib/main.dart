import 'package:fingetxinsta/Root.dart';
import 'package:fingetxinsta/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/init_bindings.dart';
import 'src/app.dart';

//20:12
void main() async {
  //이니셜해주는것
  WidgetsFlutterBinding.ensureInitialized();

  //파이어베이스 셋팅
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
      )),
      initialBinding: InitBinding(),
      home: const Root(),
    );
  }
}
