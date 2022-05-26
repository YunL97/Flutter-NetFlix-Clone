import 'package:fingetxinsta/components/avatar_widget.dart';
import 'package:fingetxinsta/components/image_data.dart';
import 'package:fingetxinsta/components/user_card.dart';
import 'package:fingetxinsta/controller/auth_controller.dart';
import 'package:fingetxinsta/controller/mypage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPage extends GetView<MyPageController> {
  const MyPage({Key? key}) : super(key: key);

  Widget _statisticsOne(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  Widget _infomation() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarWidget(
                  thumbPath: controller.targetUser.value.thumbnail!,
                  type: AvatarType.TYPE3,
                  size: 80,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: _statisticsOne('Post', 15)),
                      Expanded(child: _statisticsOne('Followers', 11)),
                      Expanded(child: _statisticsOne('Following', 3)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              controller.targetUser.value.description!,
              style: TextStyle(fontSize: 13, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Color(0xffdedede))),
            child: Text(
              'Edit profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )),
          const SizedBox(
            width: 8,
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: const Color(0xffefefef),
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Color(0xffdedede))),
            child: ImageData(IconsPath.addFriend),
          )
        ],
      ),
    );
  }

  Widget _discoverPeople() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover People',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                'See All',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
              children:
                  List.generate(10, (index) => const UserCard()).toList()),
        ),
      ],
    );
  }

  Widget _tabMenu() {
    return TabBar(
        controller: controller.tabController,
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        tabs: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ImageData(IconsPath.gridViewOn),
          ),
          Container(
            child: ImageData(IconsPath.myTagImageOff),
          ),
        ]);
  }

  Widget _tabView() {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 100,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Obx(
          () => Text(
            //파이어베이스 데이터
            controller.targetUser.value.nickname!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.uploadIcon,
                width: 50,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.menuIcon,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _infomation(),
            _menu(),
            _discoverPeople(),
            const SizedBox(height: 20),
            _tabMenu(),
            _tabView(),
          ],
        ),
      ),
    );
  }
}
