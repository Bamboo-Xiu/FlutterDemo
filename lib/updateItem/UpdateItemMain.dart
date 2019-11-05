import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/updateItem/UpdateItemModel.dart';
import 'package:flutter_app1/updateItem/UpdateItemView.dart';

class UpdateItemMain extends StatelessWidget{
  final UpdateItemModel _updateItemModel = new UpdateItemModel('http://e.hiphotos.baidu.com/image/pic/item/71cf3bc79f3df8dcedf7cd91c211728b461028e3.jpg',
      '涛 App',
      '22.3',
      '2019-11-06',
      '关于涛姐的作品，新闻等资讯尽在 涛 App',
      'v3.6.6');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UpdateItem Demo'),
      ),
      body: new UpdateItemView(
        key,
          _updateItemModel,
          null
      ),
    );
  }
}