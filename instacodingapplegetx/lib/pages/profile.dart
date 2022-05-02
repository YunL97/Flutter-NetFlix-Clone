import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

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
