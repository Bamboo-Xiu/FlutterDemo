import 'package:flutter/material.dart';

class FlexLayoutTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlexLayout and Wrap"),
      ),
      body: Center(
          child: new Column(
            children: <Widget>[
              //Flex的两个子widget按1：2来占据水平空间
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex:1,    //设置比例系数
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: SizedBox(
                  height: 100.0,
                  //Flex的三个子widget，在垂直方向按2:1:1来占用100像素的空间
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text("以下是Wrap样例", style: TextStyle(fontSize: 20.0),),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("A"),),
                      label: new Text("Hamilton"),
                    ),
                    new Chip(
                        avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("M"),),
                        label: new Text("Lafayette")
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("H"),),
                      label: new Text("Mulligan"),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue,child: Text("J"),),
                      label: new Text("Laurens"),
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}