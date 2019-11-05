import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/updateItem/UpdateItemModel.dart';

class UpdateItemView extends StatelessWidget{
  final UpdateItemModel model;    // 数据模型
  final VoidCallback onPressed;    // 点击回调
  // 构造函数语法糖，用来给 model 赋值
  UpdateItemView(Key key,this.model, this.onPressed) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(    // 用 Column 将上下两部分合体
      children: <Widget>[
        buildTopRow(context),    // 上半部分
        buildBottomRow(context)    // 下半部分
      ],
    );
  }

  Widget buildTopRow(BuildContext context){
    return Row(    // Row 控件，用来水平摆放子 Widget
      children: <Widget>[
        Padding(    // Padding 控件，用来设置 Image 控件边距
            padding: EdgeInsets.all(10),    // 上下左右边距均为 10
            child: ClipRRect(    // 圆角矩形裁剪控件
              borderRadius: BorderRadius.circular(8.0),    // 圆角半径为 8
              child: Image.network(model.appIcon,width: 80,height: 80,),    // 图片控件
            )
        ),
        Expanded(    // Expanded 控件，用来拉伸中间区域
          child: Column(    // Column 控件，用来垂直摆放子 Widget
            mainAxisAlignment: MainAxisAlignment.center,    // 垂直方向居中对齐
            crossAxisAlignment: CrossAxisAlignment.start,    // 水平方向居左对齐
            children: <Widget>[
              Text(model.appName,maxLines: 1,),    // App 名称
              Text(model.appDate,maxLines: 1,),    // App 更新日期
            ],
          ),
        ),
        Padding(    // Padding 控件，用来设置 Widget 间边距
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),    // 右边距为 10，其余为 0
          child: FlatButton(    // 按钮控件
            child: Text("OPEN"),
            onPressed: onPressed,    // 点击回调
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context){
    return Padding(    // Padding 控件用来设置整体边距
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),    // 左边距和右边距为 15
      child: Column(    // Column 控件用来垂直摆放子 Widget
        crossAxisAlignment: CrossAxisAlignment.start,    // 水平方向居左对齐
        children: <Widget>[
          Text(model.appDescription),    // 更新文案
          Padding(    // Padding 控件用来设置边距
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),   // 上边距为 10
            child: Text("${model.appVersion} • ${model.appSize} MB"),
          )
        ],
      ),
    );
  }
}

