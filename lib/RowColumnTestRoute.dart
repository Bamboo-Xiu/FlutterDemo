import 'package:flutter/material.dart';

class RowColumnTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row and Column show"),
      ),
      body: Center(
        child: new Column(
          //测试Row对齐方式，排除Column默认居中对齐的
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("hello world "),
                Text("I am Jack"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("hello world "),
                Text("I am Jack"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("hello world "),
                Text("I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text("hello world ",style: TextStyle(fontSize: 30.0),),
                Text("I am Jack "),
              ],
            ),
            Text("以下为Row与Column嵌套的相关知识",style: TextStyle(fontSize: 20.0),),
            Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,//有效，外层Column高度为整个屏幕
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,//无效，内层Column高度为实际高度
                        children: <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}