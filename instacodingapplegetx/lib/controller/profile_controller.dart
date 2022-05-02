
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class ProfileController extends GetxController {

  RxString name = 'john lee'.obs;
  RxInt follower = 0.obs;
  RxBool followerbutton = false.obs;
  RxList profileImage = [].obs;

  void getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body);
    profileImage = result2;
  }

  void ChangeName() {
    name('john park');
  }
  ClickFollowerButton() {
    if (followerbutton == false){
      ++follower;
      followerbutton(true);
    }else {
      --follower;
      followerbutton(false);
    }
  }

  int ProfileImagelength() {
    return profileImage.length;
}

}