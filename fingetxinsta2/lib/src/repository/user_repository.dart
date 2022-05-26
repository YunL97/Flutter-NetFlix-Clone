import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fingetxinsta/src/models/instagram_user.dart';

class UserRepository {
  static Future<IUser?> loginUserByUid(String uid) async {
    print(uid);
    var data = await FirebaseFirestore.instance
        .collection('user')
        .where('uid', isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      return IUser.fromJson(data.docs.first.data());
    }
  }

  //파이어베이스에 데이터 넣는 코드
  static Future<bool> signup(IUser user) async {
    try {
      await FirebaseFirestore.instance.collection('user').add(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
