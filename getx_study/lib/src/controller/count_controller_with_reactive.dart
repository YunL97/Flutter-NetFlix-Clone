
import 'package:get/get.dart';

enum Num { FIRST, SECOND}

// 값이 바뀔때만 호출된다. 상태관리하기 좋다.
//Rx, obs 반응형
class CountControllerWithRecative extends GetxController{
  RxInt count = 0.obs;
  RxDouble _dd = 0.0.obs;
  RxString str = "".obs;
  Rx<Num> nums = Num.FIRST.obs;

  void increase() {

    count++;
    _dd + 1.0;
    print(_dd + 1.0);

  }

  void putNumber(int value){

    //여기서는 이상하게 밑에처럼써야 count에 값이 들어감
    count(value);
  }
  @override
  void onInit() {

    //count가 바뀔때마다 매번 호출
    ever(count,(_) => print("매번호출"));
    once(count,(_) => print("한번만 호출"));

    //사용자가 검색쪽 사용할때 사용, ex) 검색창에 뭐 칠때누를때마다 서버에 서치하면 서버에 부하가 걸림
    debounce(count, (_) => print("마지막 변경에 한번만 호출"), time: Duration(seconds: 1));
    
    interval(count, (_) => print("변경되고 있는 동안 1초마다 호출"));
    // TODO: implement onInit
    super.onInit();
  }

}