import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() async{
    //목록가져오기
    // var result = await firestore.collection('product').doc('INmDj0z05cT1nT0UVA5o').get();
    // print(result['price']);

    //데이터 다가져오기;
    // var result = await firestore.collection('product').get();
    // if(result.docs.isNotEmpty) {
    //   for ( var doc in result.docs){
    //     print(doc['name']);
    //   }
    // }
    //or
    // try {
    //   var result = await firestore.collection('product').get();
    //     for ( var doc in result.docs){
    //       print(doc['name']);
    //     }
    // }catch (e){
    //       print("에러남");
    // }





  }
  _addData() async{
    await firestore.collection('product').add({'name': '내복', 'price' : 5000});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _addData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("샵페이지임"),
    );
  }
}
