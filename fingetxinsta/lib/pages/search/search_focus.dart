import 'package:fingetxinsta/components/image_data.dart';
import 'package:fingetxinsta/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        menu,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSize _tabMenu() {
    return PreferredSize(
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne("인기"),
              _tabMenuOne("계정"),
              _tabMenuOne("오디오"),
              _tabMenuOne("태그"),
              _tabMenuOne("장소"),
            ]),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  Widget _body() {
    return TabBarView(controller: tabController, children: [
      Center(
        child: Text('인기페이지'),
      ),
      Center(
        child: Text('계정페이지'),
      ),
      Center(
        child: Text('오디오페이지'),
      ),
      Center(
        child: Text('태그페이지'),
      ),
      Center(
        child: Text('장소페이지'),
      ),
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            BottomNavController.to.willPopAction();
            // Get.find<BottomNavController>().willPopAction();
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(
              IconsPath.backBtnIcon,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Color(0xffefefef)),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 4, top: 7, bottom: 7),
                border: InputBorder.none,
                isDense: true,
                hintText: '검색'),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}
