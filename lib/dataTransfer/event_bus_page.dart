import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'dart:async';

class CustomEvent{    // 定义一个事件，相当于发送方和接收方的 暗号
  String msg;
  CustomEvent(this.msg);
}

EventBus eventBus = new EventBus();


class FirstPage extends StatefulWidget{
  State<StatefulWidget> createState()=>_FirstPageState();
}


class _FirstPageState extends State<FirstPage>{
  String msg = '通知';
  StreamSubscription subscription;

  @override
  void initState() {
    // 监听 CustomEvent 事件，刷新 UI
    subscription = eventBus.on<CustomEvent>().listen((event){
      print(event);
      setState(() {
        msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Text(msg),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()))),
    );
  }

  @override
  void dispose() {
    // State 销毁时，清理注册
    subscription.cancel();
    super.dispose();
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page'),),
      body: RaisedButton(
        child: Text('Fire Event'),
        onPressed: ()=> eventBus.fire(CustomEvent('hello')),    // 发送事件
      ),
    );
  }
}