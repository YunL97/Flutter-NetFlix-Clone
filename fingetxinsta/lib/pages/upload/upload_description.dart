import 'package:fingetxinsta/components/image_data.dart';
import 'package:fingetxinsta/controller/upload_controller.dart';
import 'package:fingetxinsta/src/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadDescription extends GetView<UploadController> {
  const UploadDescription({Key? key}) : super(key: key);

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          SizedBox(
            width: 63,
            height: 63,
            child: Image.file(controller.filteredImage!, fit: BoxFit.cover),
          ),
          Expanded(
              child: TextField(
            //컨트롤러로 textfield에서 쓰는 text 저장
            controller: controller.textEditingController,
            maxLines: null,
            decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
                hintText: '문구 입력...'),
          ))
        ],
      ),
    );
  }

  Widget infoOne(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  Widget get line => const Divider(
        color: Colors.grey,
      );

  Widget snsInfo() {
    bool _isChecked = false;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'FaceBook',
                style: TextStyle(fontSize: 17),
              ),
              Switch(
                value: _isChecked,
                onChanged: (bool value) {
                  _isChecked = value;
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Twitter',
                style: TextStyle(fontSize: 17),
              ),
              Switch(
                value: _isChecked,
                onChanged: (bool value) {
                  _isChecked = value;
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tumblr',
                style: TextStyle(fontSize: 17),
              ),
              Switch(
                value: _isChecked,
                onChanged: (bool value) {
                  _isChecked = value;
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: ImageData(
              IconsPath.backBtnIcon,
              width: 15.0,
            ),
          ),
        ),
        title: const Text(
          '새 게시물',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              controller.uploadPost();
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ImageData(
                IconsPath.uploadComplete,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _description(),
                    infoOne('사람 태그하기'),
                    line,
                    infoOne('위치 추가'),
                    line,
                    infoOne('다른 미디어에도 게시'),
                    line,
                    snsInfo()
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
