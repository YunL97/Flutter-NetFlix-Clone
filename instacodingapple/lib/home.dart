import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key , this.data,required this.addData}) : super(key: key);
  final data;
  final addData;
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //스크롤 관련 데이터들 바로바로 저장됨
  var scroll = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    //scroll이 바뀔때마다 실행, listener은 필요 없어지면 제거하는것도 성능상 좋음
    //scroll에 addlistener이 옵저버 같은 역할인가?
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent){
        // print("같음");
        getMore();
      }
    });
  }

  //마지막 도착하면 이미지 나옴
  getMore() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    widget.addData(result2);
    print("aa");
  }

  @override
  Widget build(BuildContext context) {

    if (widget.data.isNotEmpty) {
      return Container(
          child: ListView.builder(
            controller: scroll,
            itemCount: widget.data.length,
            itemBuilder: (context, i) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image(image: AssetImage("assets/images/download.jpg"), fit: BoxFit.fitWidth),
                    widget.data[i]['image'].runtimeType == String ? Image.network(widget.data[i]['image']) : Image.file(widget.data[i]['image']),
                    GestureDetector(
                      child: Text(widget.data[i]['user']),
                      onTap: () {
                        Navigator.push(context,
                        //기본 route 애니메이션
                        // CupertinoPageRoute(builder: (c) => Profile())
                            
                            //커스텀 route 애니메이션
                            PageRouteBuilder(pageBuilder: (c, a1, a2) => Profile(),
                                //context: 새로운 context 새로 생성,
                                // a1: animation object, 페이지 전환 얼마나 되었는지 0-1로 알려줌
                                //a2 : 기존페이지를 애니메이션 쓰고 싶을 때 사용
                                //child: 새로 띄울 페이지
                                transitionsBuilder: (c, a1, a2, child) =>

                                   /* FadeTransition(opacity: a1, child: child,),
                                    transitionDuration: Duration(microseconds: 1000500) */
                              SlideTransition(position: Tween(
                                begin: Offset(1.0, 0.0),
                                end: Offset(0.0, 0.0)
                              ).animate(a1),
                              child: child,
                                
                              )
                        )
                        );
                      },
                    )
                    ,
                    Text(widget.data[i]['likes'].toString()),
                    Text(widget.data[i]['content'])
                  ]
              );
              print("a");
            },
          )
      );
    }else {
      return Text("로딩중");
    }
  }
}

//state보관함: provider
class Store1 extends ChangeNotifier {
  var name = 'john kim';
  var follower = 0;
  var followerbutton = false;
  var profileImage = [];
  notifyListeners();
  
  
  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body);
    profileImage = result2;
    print("123123${profileImage.length}");
    notifyListeners();
  }
  
  ChangeName() {
    name = 'john park';
    
    //재렌더링
    notifyListeners();
  }
  ClickFollowerButton() {
    if (followerbutton == false){
      ++follower;
      followerbutton = true;
    }else {
      --follower;
      followerbutton = false;
    }
    notifyListeners();
  }
}

class Store2 extends ChangeNotifier {

}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.watch<Store1>().name),),
      body: CustomScrollView(
       slivers: [
         SliverToBoxAdapter(
           child: ProfileHeader(),
         ),
         SliverGrid(
           delegate: SliverChildBuilderDelegate(
               (c,i) => Container(
                 child: Image.network(context.watch<Store1>().profileImage[i])
               ),
             childCount: context.watch<Store1>().profileImage.length
           ),
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
         )
       ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: () {
          context.read<Store1>().ChangeName();
        }, child: Text('버튼')),
        Text("${context.watch<Store1>().follower}"),
        ElevatedButton(onPressed: (){
          context.read<Store1>().ClickFollowerButton();
        }, child: Text("팔로우")),
        ElevatedButton(onPressed: (){
          context.read<Store1>().getData();
        }, child: Text("사진 가져오기")),
      ],
    );
  }
}

