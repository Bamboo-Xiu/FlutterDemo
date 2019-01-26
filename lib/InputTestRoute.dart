import 'package:flutter/material.dart';

class InputTestRoute extends StatefulWidget {
  @override
  _InputTestRouteState createState() => new _InputTestRouteState();
}

class _InputTestRouteState extends State<InputTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("输入用户名与密码"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,//关联focusNode1
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名或邮箱",
              ),
              onChanged: (v){
                print("onChange: $v");
              },
            ),
            TextField(
              focusNode: focusNode2,//关联focusNode2
              decoration: InputDecoration(
                  labelText: "密码",
              ),
              obscureText: true,
            ),
            Builder(builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if(null == focusScopeNode){
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
            ),
          ],
        ),
      ),
    );
  }

}