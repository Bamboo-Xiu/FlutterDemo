import 'package:flutter/material.dart';
import 'package:flutter_app1/animationDemo/builder_animation_widget.dart';
import 'package:flutter_app1/animationDemo/hero_transition.dart';
import 'package:flutter_app1/animationDemo/normal_animation_widget.dart';
import 'package:flutter_app1/animationDemo/widget_animate_widget.dart';

class AnimationDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final String title;
  MyHomePage({Key key,this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            NormalAnimationWidget(),
            BuilderAnimationWidget(),
            WidgetAnimateWidget(),
            Page1()
          ],

        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home),text: '普通动画',),
            Tab(icon: Icon(Icons.rss_feed),text: 'Builder动画',),
            Tab(icon: Icon(Icons.perm_identity),text: 'Widget动画',),
            Tab(icon: Icon(Icons.message),text: 'hero动画',)
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}


/**
 * AnimationBuilder 类 主要是为了将动画和渲染职责分离
**/