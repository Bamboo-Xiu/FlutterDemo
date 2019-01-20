import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Widget show"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            RaisedButton(    //漂浮按钮，默认带有阴影和灰色背景
              child: Text("RaisedButton"),
              onPressed: () => {},
            ),
            FlatButton(    //扁平按钮，默认背景透明并不带阴影
              child: Text("FlatButton"),
              onPressed: () => {},
            ),
            OutlineButton(
              child: Text("OutlineButton"),
              onPressed: () => {},
            ),
            IconButton(    //IconButton是个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            ),
            RaisedButton(
              color: Colors.blue,    //按钮背景颜色
              highlightColor: Colors.blue[700],    //按钮按下时的背景色
              colorBrightness: Brightness.dark,    //按钮主题，默认是浅色主题
              splashColor: Colors.grey,    //点击时，水波动画中水波的颜色
              child: Text("Submit"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),    //外形
              onPressed: () => {},    //按钮点击回调
            )
          ],
        ),
      ),
    );
  }
}