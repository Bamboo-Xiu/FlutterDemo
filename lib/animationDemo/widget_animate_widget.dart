import 'package:flutter/material.dart';

class WidgetAnimateWidget extends StatefulWidget{
  State<StatefulWidget> createState()=> _WidgetAnimateWidgetState();
}

class _WidgetAnimateWidgetState extends State<WidgetAnimateWidget> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // 创建动画周期为 1 秒 的 AnimationController 对象
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    );

    final CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut
    );

    // 创建从 50 到 200 线性变化的 Animation 对象
    animation = Tween(
        begin: 50.0,
        end: 200.0
    ).animate(curve);

    // 启动动画
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationLogo(animation: animation,),
    );
  }
}


class AnimationLogo extends AnimatedWidget{
  AnimationLogo({Key key,Animation<double> animation})
    :super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}