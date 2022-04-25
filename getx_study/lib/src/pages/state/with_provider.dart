import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_study/src/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Provider ", style: TextStyle(fontSize: 30),),
          Consumer<CountControllerWithProvider>(
            builder: (context, snapshot, child){
              return Text("${snapshot.count}", style: TextStyle(fontSize: 50),);
            },
          ),

          ElevatedButton(onPressed: (){
            //Provider을 이용해서 Consumer쪽만 빌드되게함 listen: false를 사용하는 이유는
            //listen :false를 하지않으면 build부터 다시 로드 되고, 그럼 Consumer과 충돌되게된다
              Provider.of<CountControllerWithProvider>(context, listen: false ).increase();
          }, child: Text("+", style: TextStyle(fontSize: 30)),
          )
        ],
      ),
    );
  }
}

