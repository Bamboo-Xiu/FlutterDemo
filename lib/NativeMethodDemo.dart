import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 还有一部分代码在 MainActivity 中
class NativeMethodDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NativeMethod Demo",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: DefaultPage(),
    );
  }
}

// 声明方法频道
const platform = MethodChannel('wjc/navigation');

class DefaultPage extends StatelessWidget{
  DefaultPage({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(title: Text("Default Page"),),
      body: Center(
        child: RaisedButton(
          child: Text("打开应用商店"),
          onPressed: (){
            handleButtonClick();
          },
        ),
      ),
    );
  }
}


handleButtonClick() async{
  int result;
  // 异常捕获
  try{
    // 异步等待方法调用的结果
    result = await platform.invokeMethod("openAppStore");
  }catch(e){
    result = -1;
  }
  print('Result : $result');
}


// 关于 Android、iOS 和 Dart 平台间的常见数据类型转换，只要记住，像 null、布尔、整型、
// 字符串、数组和字典这些基础类型，是可以在各个平台之间以平台的规则去混用就可以了。
// 具体的基础类型有：
// Android: null  Boolean  Integer  Long  Double  String  ArrayList  HashMap
// Dart:    null  bool     int      int   double  String  List       Map
// iOS:     nil或NSNull  NSNumber numberWithBool  NSNumber numberWithInt  NSNumber numberWithLong  NSNumber numberWithDouble  NSString  NSArray  NSDictionary