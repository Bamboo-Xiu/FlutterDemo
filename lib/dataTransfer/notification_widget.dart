import 'package:flutter/material.dart';

class CustomNotification extends Notification{
  final String mag;
  CustomNotification(this.mag);
}


class CustomChild extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      // 按钮点击时分发通知
      onPressed: ()=> CustomNotification("Hi").dispatch(context),
      child: Text('Fire Notification'),
    );
  }
}


class NotificationWidget extends StatefulWidget{
  State<StatefulWidget> createState()=> _NotificationState();
}


class _NotificationState extends State<NotificationWidget>{
  String _mag = '通知';
  @override
  Widget build(BuildContext context) {
    // 监听通知
    return NotificationListener<CustomNotification>(
      onNotification: (notification){
        setState(() {
          _mag += notification.mag + ' ';
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_mag),
          CustomChild()
        ],
      ),
    );
  }
}