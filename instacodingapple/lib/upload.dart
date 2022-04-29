import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key, required this.userImage, this.setUserContent, this.addMyData}) : super(key: key);
  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body:Container(
        color: Colors.grey,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(userImage ,height: 300),
            Text("이미지 업로드 화면"),
            TextField(onChanged: (text){
              setUserContent(text);
            },),
            IconButton(onPressed: (){
              addMyData();
              Navigator.pop(context);
            }, icon: Icon(Icons.add_box_outlined))
          ],
        ),
        ),
      )
    );
  }
}
