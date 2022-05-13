import 'dart:io';

import 'package:fingetxinsta/controller/auth_controller.dart';
import 'package:fingetxinsta/src/models/instagram_user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  final String uid;
  const SignupPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? thumbnailXFild;

  void update() => setState(() {});

  Widget _avatar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 100,
            height: 100,
            child: thumbnailXFild != null
                ? Image.file(
                    File(thumbnailXFild!.path),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/default_image.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () async {
            thumbnailXFild = await _picker.pickImage(
                source: ImageSource.gallery, imageQuality: 100);
            update();
          },
          child: Text('이미지 변경'),
        )
      ],
    );
  }

  Widget _nickname() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: nicknameController,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20), hintText: '닉네임'),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: descriptionController,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20), hintText: '설명'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '회원가입',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
            ),
            _avatar(),
            SizedBox(
              height: 30,
            ),
            _nickname(),
            SizedBox(
              height: 30,
            ),
            _description(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: ElevatedButton(
          onPressed: () {
            //validation
            print(nicknameController.text);
            print(descriptionController.text);
            var signupUser = IUser(
                uid: widget.uid,
                nickname: nicknameController.text,
                description: descriptionController.text);
            AuthController.to.signup(signupUser, thumbnailXFild);
          },
          child: Text('회원가입'),
        ),
      ),
    );
  }
}
