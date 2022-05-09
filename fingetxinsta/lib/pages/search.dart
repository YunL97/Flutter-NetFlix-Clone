import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fingetxinsta/pages/search/search_focus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;

      size = Random().nextInt(100) % 2 == 0 ? 1 : 2;

      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
    print(groupBox);
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              //버튼 네비게이션 안사라지게 하는법
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xffefefef)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              groupBox.length,
              (index) => Expanded(
                    child: Column(
                      children: List.generate(
                          groupBox[index].length,
                          (jndex) => Container(
                                height:
                                    Get.width * 0.33 * groupBox[index][jndex],
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)]),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        'https://cdn.mkhealth.co.kr/news/photo/202102/52163_52859_5928.jpg',
                                    fit: BoxFit.cover),
                              )).toList(),
                      //     children: [
                      //   Container(
                      //     margin: const EdgeInsets.all(1),
                      //     height: 140,
                      //     color: Colors.red,
                      //   ),
                      // ]
                    ),
                  )).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(child: _body())
            // _body()
          ],
        ),
      ),
    );
  }
}
