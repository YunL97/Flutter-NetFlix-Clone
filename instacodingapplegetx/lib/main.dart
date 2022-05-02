import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacodingapple/notification.dart';
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


import 'firebase_options.dart';
import 'pages/home.dart';


void main()  async{

  //파이어베이스 연동 코드
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    //MaterialApp 자식 위젯들은 전부 Store1에 있던 state 사용가능

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => Store1()),
          ChangeNotifierProvider(create: (c) => Store2()),
        ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: style.theme,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => MyApp()),
              GetPage(name: '/upload', page: () => Upload()),
              GetPage(name: '/profile', page: () => Profile()),
          ],
          ),
        ),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var data = [];
  var userImage;
  var userContent;

  //핸드폰에 데이터 저장
  savaData() async {
    var storage = await SharedPreferences.getInstance();

    //json으로 저장하는법
    var map = {'age': 20};
    storage.setString('map', jsonEncode(map));
    // print(map);  //{age: 20}
    // print(jsonEncode(map)); //{"age":20}
    var result = storage.getString('map') ?? "데이터 없음";
    print(jsonDecode(result)['age']);
  }

  //업로드 데이터, 데이터 맨앞단으로 들어오게.
  addMyData() {
    var myData = {
      'id': data.length,
      'image': userImage,
      'like':5,
      'date': 'July 25',
      'content': '등을대라',
      'liked': false,
      'user': 'lee',
    };
    setState(() {
      data.insert(0, myData);
    });
  }

  setUserContent(a) {
    setState(() {
      userContent = a;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initNotification(context);
    savaData();
    getData();
  }

  addData(a) {
    setState(() {
      data.add(a);
    });
  }

  getData() async {
    var result = await http.get( Uri.parse('https://codingapple1.github.io/app/data.json') );
    if (result.statusCode == 200) {

    }else {

    }
    var result2 = jsonDecode(result.body);
    // print(result2[0]['likes']);
    setState(() {
      data = result2;
    });

    // print(result2[0]);
  }


  @override
  Widget build(BuildContext context) {

    //반응형 디자인 현재 페이지의 가로를 알려주는 코드
    MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: FloatingActionButton(child: Text('+'), onPressed: (){
          showNotification2();
        },),
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(icon: Icon(Icons.add_box_outlined),
            onPressed: () async{

            //선택화면 띄우는법법
           var picker = ImagePicker();
            var image = await picker.pickImage(source: ImageSource.gallery);
            print("aasdasdkqwhdkwqd");
            if (image != null) {
              setState(() {
                userImage = File(image.path);
              });
            }else {
              return Get.toNamed('/');
            }
            //파일경로로 이미지 띄우는법
            // Image.file(userImage);

            return Get.toNamed('/upload', arguments: {
              'userImage':userImage,
              'setUserContent':setUserContent,
              'addMyData':addMyData,
            });
              
            },
            iconSize: 30,
          ),
          Text("da", style: TextStyle(color: Colors.white),)
        ],
      ),
      // 원하는 ThemeData안의 내용을 불러옴
      body: [
        Home(data: data, addData: addData,),
        Shop()
      ][tab],
          
      // Text("안녕하세요", style: Theme.of(context).textTheme.bodyText2,),
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.60),
        currentIndex: tab,
        onTap: (i){
          if (i == 0) {
            setState(() {
              tab =0;

            });
          }else {
            setState(() {
              tab =1;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
              label:  "홈",
            icon:Icon(Icons.home_outlined,)
          ),
          BottomNavigationBarItem(
              label:  "샵",
              icon:Icon(Icons.shopping_bag_outlined)
          ),
        ],
      ),
    );
  }
}
