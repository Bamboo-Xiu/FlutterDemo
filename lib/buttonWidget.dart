import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Widget and Container show"),
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
            ),
            Text("以下为Container内容：",style: TextStyle(fontSize: 20.0),),
            Container(
              margin: EdgeInsets.only(top: 50.0,left: 120.0),    //容器外补白
              constraints: BoxConstraints.tightFor(width: 200.0,height: 150.0),   //卡片大小
              decoration: BoxDecoration(    //背景装饰
                borderRadius: BorderRadius.circular(4.0),
                gradient: RadialGradient(    //背景径向渐变
                  colors: [Colors.red,Colors.orange],
                  center: Alignment.topLeft,
                  radius: 0.98
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(4.0, 2.0),    //阴影的大小
                    blurRadius: 6.0    //阴影模糊处理的半径大小
                  )
                ]
              ),
              transform: Matrix4.rotationZ(.2),    //卡片倾斜变换
              alignment: Alignment.center,
              child: Text(
                "5.20",style: TextStyle(color: Colors.white,fontSize: 40.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}