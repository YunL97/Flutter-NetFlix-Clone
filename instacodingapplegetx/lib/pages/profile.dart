import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacodingapple/controller/profile_controller.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(title:
      // Text(context.watch<Store1>().name),
        GetX<ProfileController>(
          builder: (_){
            return Text(
              "${_.name.value}"
            );
          }),
        ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProfileHeader(),
          ),
    GetX<ProfileController>(
    builder: (_){return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                    (c,i) => Container(
                    child: Image.network(_.profileImage[i]),

                    // Image.network(context.watch<Store1>().profileImage[i])),
            ),
                 childCount: (_.count.value ?? 0),
                // context.watch<Store1>().profileImage.length),
            )
            ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _.grid.value),
          );
      }),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: () {
          // context.read<Store1>().ChangeName();
          Get.find<ProfileController>().ChangeName();
        }, child: Text('버튼')),
        // Text("${context.watch<Store1>().follower}"),
        ElevatedButton(onPressed: (){
          // context.read<Store1>().ClickFollowerButton();
        }, child: Text("팔로우")),
        ElevatedButton(onPressed: (){
          // context.read<Store1>().getData();
          Get.find<ProfileController>().getData();
        }, child: Text("사진 가져오기")),
      ],
    );
  }
}
