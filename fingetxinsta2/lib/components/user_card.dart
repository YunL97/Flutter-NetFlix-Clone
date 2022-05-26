import 'package:fingetxinsta/components/avatar_widget.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 100,
      height: 195,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black12)),
      child: Stack(
        children: [
          Positioned(
            left: 13,
            top: 0,
            right: 13,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                AvatarWidget(
                  thumbPath:
                      'http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg',
                  type: AvatarType.TYPE2,
                  size: 80,
                ),
                const Text(
                  '윤식',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const Text(
                  '윤식님이 팔로우합니다.',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(onPressed: () {}, child: Text('follow'))
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
