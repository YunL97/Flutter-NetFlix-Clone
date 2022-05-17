import 'dart:typed_data';

import 'package:fingetxinsta/components/image_data.dart';
import 'package:fingetxinsta/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends GetView<UploadController> {
  Upload({Key? key}) : super(key: key);

  //빌드 다시하기때문에 setState호출할 때마다 화면 깜빡임
  // void update() => setState(() {});

  Widget _imagePreview() {
    // var width = MediaQuery.of(context).size.width;
    var width = Get.width;
    return Container(
      width: Get.width,
      height: Get.width,
      // color: Colors.grey,
      child: Obx(() => controller.titleImage.value == false
          ? Container()
          : FutureBuilder(
              future: controller.selectedImage.value.thumbnailData,
              builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.hasData) {
                  return Image.memory(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container(
                    width: 200,
                    height: 200,
                    color: Colors.black,
                  );
                }
              })),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: Get.context!,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),

                  //끝가지 올라감
                  isScrollControlled:
                      controller.albums.length > 10 ? true : false,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(Get.context!).size.height -
                          MediaQuery.of(Get.context!).padding.top),
                  builder: (_) => Container(
                        height: controller.albums.length > 10
                            ? Size.infinite.height
                            : controller.albums.length * 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black54,
                                ),
                                width: 40,
                                height: 4,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                  child: Column(
                                children: List.generate(
                                    // albums.length,
                                    controller.albums.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            controller.changeAlbum(
                                                controller.albums[index]);
                                            Get.back();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 20),
                                            child: Text(
                                                controller.albums[index].name),
                                          ),
                                        )),
                              )),
                            )
                          ],
                        ),
                      ));
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Obx(
                    () => Text(
                      controller.headerTitle.value,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xff808080),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      '여러항목 선택',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff808080)),
                child: ImageData(IconsPath.cameraIcon),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return Obx(
      () => GridView.builder(
          //GridView가 스크롤지원, SingleChildScrollView도 스크롤 지원 그래서 안나옴
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          //이거 해주면 여기서 스크롤 안쓰겠다는 뜻

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1),
          itemCount: controller.imageList.length,
          itemBuilder: (BuildContext context, int index) {
            return _photoWidget(controller.imageList[index], index: index);
          }),
    );
  }

  Widget _photoWidget(AssetEntity asset, {int index = 0}) {
    //futurebuilder: 데이터를 다받기전에 데이터가 없이 그릴 수 없는 부분을 먼저 그려주기 위해서 사용
    //futurebuilder이 없으면 데이터가 다 받아지기를 기다릴 후 화면ㅇ르 그리거나 데이터가 변함을 setState()를 통해 바꿔주어야한다.
    //builder부분이 실행되고 끝나면 future부분이 실행된다.
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(ThumbnailSize(200, 200)),
        builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                controller.changeSelectedImage(controller.imageList[index]);
              },
              child: Obx(
                () => Opacity(
                  opacity: controller.imageList[index] ==
                          controller.selectedImage.value
                      ? 0.3
                      : 1,
                  child: Image.memory(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.closeImage),
          ),
        ),
        elevation: 0,
        title: const Text(
          "New Post",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              controller.gotoImageFilter();
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ImageData(
                IconsPath.nextImage,
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
