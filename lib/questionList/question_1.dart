import 'package:flutter/material.dart';

/// Row 布局中有 3 个 widget，实现 3 个 widget 的高度填充整个 Row（即 3 个子 widget 中
/// 高度最大的那个高度）
class question_1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('question_1'),
      ),
      body: Column(
        children: <Widget>[
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Container(
//                color: Colors.green,
//                height: 50,
//                width: 30,
//              ),
//              Container(
//                color: Colors.red,
//                height: 90,
//                width: 30,
//              ),
//              Container(
//                color: Colors.purple,
//                height: 30,
//                width: 30,
//              ),
//            ],
//          ),

          ListView(
            children: <Widget>[
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(color: Colors.blue,height: 300,),
                    ),
                    Container(color: Colors.red,width: 50,height: 200,),
                    Container(color: Colors.yellow,width: 50,height: 100,),
                  ],
                ),
              )
            ],
          )
        ],
      )

    );

  }
}