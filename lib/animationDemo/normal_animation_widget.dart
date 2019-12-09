import 'package:flutter/material.dart';

class NormalAnimationWidget extends StatefulWidget{
  State<StatefulWidget> createState()=> _NormalAnimationState();
}


class _NormalAnimationState extends State<NormalAnimationWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;    // 该对象管理着 animation 对象
  Animation<double> animation;    // 该对象是当前动画的状态，例如动画是否开始，停止，前进，后退，但是绘制在屏幕上的内容不知道

  @override
  void initState() {
    super.initState();
    // 创建动画周期为 1 秒的 AnimationController 对象
    controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000)
    );

    final CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut
    );

    // 创建从 50 到 200 线性变化的 Animation 对象，普通动画需要手动监听动画状态，刷新 UI
    animation = Tween(
      begin: 50.0,
      end: 200.0,
    ).animate(curve)
      ..addListener(()=>setState((){}));

    // 启动动画
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: animation.value,    // 将动画的值赋给 widget 的宽高
            height: animation.value,
            child: FlutterLogo(),
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



/**
 * with 关键字：意思是混入，就是说可以将一个或者多个类的功能添加到自己的类，无需继承这些类，避免
 * 多继承导致的问题；
 * 为什么是 SingleTickerProviderStateMixin 呢？因为初始化 AnimationController 的时候
 * 需要一个 TickerProvider 类型的参数 Vsync 参数，所以我们混入了 TickerProvider 的子类
 * SingleTickerProviderStateMixin
 *
 * vsync : 在创建 AnimationController 的时候，设置了一个 vsync 属性，这个属性是用来防止
 * 出现不可见动画的。vsync 对象会把动画绑定到一个 Widget，当 Widget 不显示时，动画将会暂停，
 * 当 Widget 再次显示时，动画会重新恢复执行，这样就可以避免动画的组件不在当前屏幕时白白消耗
 * 资源。
 **/