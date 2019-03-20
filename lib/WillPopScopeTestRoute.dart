import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget{
  WillPopScopeTestRouteState createState(){
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute>{
  DateTime _lastPressedAt;    //上次点击的时间
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("WillPopScopeTestRoute"),
      ),
      body: Center(
        child: new WillPopScope(
            child: Container(
              alignment: Alignment.center,
              child: Text("1 秒内连续按两次返回键退出"),
            ),
            onWillPop: () async{
              if(_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)){
                // 两次点击间隔超过 1 秒则重新计时
                _lastPressedAt = DateTime.now();
                return false;
              }
              return true;
            }
        ),
      ),
    );
  }
}