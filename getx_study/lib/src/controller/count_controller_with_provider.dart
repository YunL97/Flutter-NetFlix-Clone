
import 'package:flutter/cupertino.dart';

//ChangeNotifier: Listener에게 notiofication 전달 가능
class CountControllerWithProvider extends ChangeNotifier {
  int count = 0;

  void increase() {
    count ++;
    notifyListeners();
  }
}