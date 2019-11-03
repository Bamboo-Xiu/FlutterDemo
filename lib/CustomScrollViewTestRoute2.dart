import 'package:flutter/material.dart';

class CustomScrollViewTestRoute2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold,为了让子级Widget（如Text）使用
    //Material Design 默认的样式风格，我们使用Material作为本路由的根
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(    // SliverAppBar 作为头图控件
            title: Text('CustomScrollView Demo'),    // 标题
            floating: true,    // 设置悬浮样式
            flexibleSpace: Image.network("http://b-ssl.duitang.com/uploads/item/201804/29/20180429134705_yk5mz.jpeg", fit: BoxFit.cover,),
            expandedHeight: 300,    // 头图控件高度
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index) => ListTile(title: Text('Item #$index')),//列表项创建方法
              childCount: 100
            ),
          )
        ],
      ),
    );
  }
}