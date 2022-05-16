import 'dart:io';

import 'package:fingetxinsta/binding/init_bindings.dart';
import 'package:fingetxinsta/src/models/instagram_user.dart';
import 'package:fingetxinsta/src/repository/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async {
    //DB 조회
    var userData = await UserRepository.loginUserByUid(uid);
    if (userData != null) {
      //db 조회할 때 인스턴스가 메모리에 올라감
      //데이터에 넣기전에 바인딩하면 데이터가 올라가지 않음
      user(userData);
      InitBinding.additionalBinding();
    }
    return userData;
  }

  void signup(IUser signupUser, XFile? thumbnail) async {
    if (thumbnail == null) {
      _submitSignup(signupUser);
    } else {
      var task = uploadXFile(thumbnail,
          '${signupUser.uid}/profile.${thumbnail.path.split('.').last}');
      task.snapshotEvents.listen((event) async {
        print(event.bytesTransferred);
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          //copyWith: 객체 카피하는이유: mutable,immutable을 만족시키기위해
          var updateUserData = signupUser.copyWith(thumbnail: downloadUrl);
          _submitSignup(updateUserData);
        }
      });
    }
  }

  UploadTask uploadXFile(XFile file, String filename) {
    var f = File(file.path);
    var ref = FirebaseStorage.instance.ref().child('users').child(filename);
    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    return ref.putFile(f, metadata);
    //users/{uid}/profile.jpg or profile.png
  }

  void _submitSignup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      loginUser(signupUser.uid!);
    }
  }
}
