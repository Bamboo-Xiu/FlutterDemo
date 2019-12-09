import 'package:flutter/material.dart';

class BuilderAnimationWidget extends StatefulWidget{

  State<StatefulWidget> createState(){
    return _BuilderAnimationState();
  }
}

class _BuilderAnimationState extends State<BuilderAnimationWidget> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // 创建动画周期为 1 秒的 AnimationController 对象
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
      end: 200.0,
    ).animate(curve);

    // 启动动画
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context,child) => Container(
              width: animation.value,
              height: animation.value,
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 释放资源
    controller.dispose();
    super.dispose();
  }
}