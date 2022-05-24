import 'package:fingetxinsta/components/image_data.dart';
import 'package:fingetxinsta/controller/bottom_nav_controller.dart';
import 'package:fingetxinsta/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/active_history.dart';
import 'pages/mypage.dart';
import 'pages/search.dart';

//class 내에서 나오는 controller 는 모두 bottomNavController 이라고 알려주는것
class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
          () => Scaffold(
            //IndexedStack: index를 가진 stack,
            //리스트뷰를 스크롤해서 보다가 다른 탭 이동후 다시 돌아오면 리스트가 초기화되는 현상 방지
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                //getx pageIndex로 화면 뿌려주기
                const Home(),

                //todo: 네비게이션바 가져가기위한 navigator
                Navigator(
                  key: controller.searchNaviationKey,
                  onGenerateRoute: (routeSetting) {
                    return MaterialPageRoute(
                        builder: (context) => const Search());
                  },
                ),

                //업로드화면은 BottomNavController에서 Get.to로 뿌려주는데
                // Container 위젯이 없으면 칸이 한칸 밀림
                Container(),
                ActiveHistory(),

                const MyPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              //controller.changeBottomNav 와 같음,왜같냐 이게
              onTap: (int index) {
                controller.changeBottomNav(index);
              },

              elevation: 0,
              items: [
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.homeOff),
                    activeIcon: ImageData(IconsPath.homeOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.searchOff),
                    activeIcon: ImageData(IconsPath.searchOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.uploadIcon), label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff),
                    activeIcon: ImageData(IconsPath.activeOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        )),
                    label: 'home'),
              ],
            ),
          ),
        ),
        //뒤로가기 누를때 실행되는 이벤트
        onWillPop: controller.willPopAction);
  }
}
