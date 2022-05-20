import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacodingapple/controller/data_list_controller.dart';

class Upload extends StatelessWidget {
  const Upload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(ListController());
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.grey,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.file(Get.find<ListController>().userImage, height: 300),
                Text("이미지 업로드 화면"),
                TextField(
                  onChanged: (text) {},
                ),
                IconButton(
                    onPressed: () {
                      Get.find<ListController>().addMyData();
                      Navigator.pop(context);
                      // Get.toNamed(page)
                    },
                    icon: Icon(Icons.add_box_outlined))
              ],
            ),
          ),
        ));
  }
}
