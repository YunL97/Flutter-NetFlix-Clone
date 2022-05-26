import 'package:fingetxinsta/components/image_data.dart';
import 'package:fingetxinsta/components/post_widget.dart';
import 'package:fingetxinsta/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/avatar_widget.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
            thumbPath:
                'http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg',
            size: 70,
            type: AvatarType.TYPE2),
        Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white)),
              child: const Center(
                child: Text(
                  '+',
                  style:
                      TextStyle(fontSize: 20, color: Colors.white, height: 1.1),
                ),
              ),
            ))
      ],
    );
  }

  //home화면 프로필 가로로 쭉 나오는 코드
  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _myStory(),
          ...List.generate(
              100,
              (index) => AvatarWidget(
                  thumbPath:
                      'https://cdn.mkhealth.co.kr/news/photo/202102/52163_52859_5928.jpg',
                  type: AvatarType.TYPE1)),
        ],
      ),
    );
  }

  //포스트 나오는 화면
  Widget _postList() {
    return Obx(() => Column(
          children: List.generate(controller.postList.length,
              (index) => PostWidget(post: controller.postList[index])).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("aaa");
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [_storyBoardList(), _postList()],
      ),
    );
  }
}
