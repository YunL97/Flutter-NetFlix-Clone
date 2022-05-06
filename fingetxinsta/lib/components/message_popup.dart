import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final title;
  final message;
  final Function()? okCallback;
  final Function()? cancleCallback;
  MessagePopup(
      {Key? key,
      required this.title,
      required this.message,
      required this.okCallback,
      this.cancleCallback})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: Get.width * 0.7,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: okCallback, child: Text('확인')),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: cancleCallback,
                        child: Text('취소'),
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
