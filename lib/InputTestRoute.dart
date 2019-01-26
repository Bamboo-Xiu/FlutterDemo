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
    focusNode1.addListener((){    //监听焦点变化
      print(focusNode1.hasFocus);
    });
    return new Scaffold(
      appBar: AppBar(
        title: Text("输入用户名与密码"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Theme(
          data: Theme.of(context).copyWith(
              hintColor: Colors.green[200],    //定义下划线颜色
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.green),    //定义label字体样式
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),    //定义提示文本样式
              )
          ),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1,//关联focusNode1
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (v){
                  print("onChange: $v");
                },
              ),
              TextField(
                focusNode: focusNode2,//关联focusNode2
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
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
      ),
    );
  }

}