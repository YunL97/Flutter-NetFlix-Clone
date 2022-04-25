
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  Home({Key? key , this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {

    if (data.isNotEmpty) {
      return Container(
          child: ListView.builder(

            itemCount: 3,
            itemBuilder: (context, i) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image(image: AssetImage("assets/images/download.jpg"), fit: BoxFit.fitWidth),
                    Image.network(data[i]['image']),
                    Text(data[i]['likes'].toString()),
                    Text(data[i]['user']),
                    Text(data[i]['content'])
                  ]
              );
              print("a");
            },
          )
      );
    }else {
      return Text("로딩중");
    }
  }
}
