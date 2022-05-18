import 'package:fingetxinsta/src/repository/post_repository.dart';
import 'package:get/get.dart';

import '../src/models/post.dart';

class HomeController extends GetxController {
  RxList<Post> postList = <Post>[].obs;
  @override
  void onInit() {
    super.onInit();
    _loadFeedList();
  }

  void _loadFeedList() async {
    var feedList = await PostRepository.loadFeedList();
    postList.addAll(feedList);
    print(feedList.length);
  }
}
