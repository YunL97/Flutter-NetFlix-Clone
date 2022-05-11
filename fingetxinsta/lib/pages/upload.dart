import 'dart:typed_data';

import 'package:fingetxinsta/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var albums = <AssetPathEntity>[];
  var headerTitle = '';
  var imageList = <AssetEntity>[];
  AssetEntity? selectedImage;
  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  //갤러리 안에있는 데이터 가져오기
  void _loadPhotos() async {
    print("asd");
    var result = await PhotoManager.requestPermissionExtend();
    print("asd");
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(minWidth: 100, minHeight: 100),
          ),
          orders: [
            const OrderOption(type: OrderOptionType.createDate, asc: false),
          ],
        ),
      );
      _loadData();
    } else {
      //message 권한 요청
    }
  }

  void _loadData() async {
    headerTitle = albums.first.name;
    await _pagingPhotos();
    update();
  }

  Future _pagingPhotos() async {
    var photo = await albums.first.getAssetListPaged(page: 0, size: 30);
    imageList.addAll(photo);
    selectedImage = imageList.first;
  }

  //??
  void update() => setState(() {});

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width,
      color: Colors.grey,
      child: selectedImage == null
          ? Container()
          : FutureBuilder(
              future: selectedImage!.thumbnailDataWithSize(
                  ThumbnailSize(width.toInt(), width.toInt())),
              builder: (_, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.hasData) {
                  return Image.memory(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container();
                }
              }),
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
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),

                  //끝가지 올라감
                  isScrollControlled: albums.length > 10 ? true : false,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top),
                  builder: (_) => Container(
                        height: albums.length * 60,
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
                                    albums.length,
                                    (index) => Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 20),
                                          child: Text(albums[index].name),
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
                  Text(
                    headerTitle,
                    style: TextStyle(color: Colors.black, fontSize: 18),
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
    return GridView.builder(
        //GridView가 스크롤지원, SingleChildScrollView도 스크롤 지원 그래서 안나옴
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        //이거 해주면 여기서 스크롤 안쓰겠다는 뜻

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return _photoWidget(imageList[index], index: index);
        });
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
                selectedImage = imageList[index];
                update();
              },
              child: Opacity(
                opacity: asset == selectedImage ? 0.3 : 1,
                child: Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
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
        title: Text(
          "New Post",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
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
