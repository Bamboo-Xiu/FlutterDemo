import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomPainterDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPainterDemo"),
      ),
      body: Cake(),
    );
  }
}

class WheelPainter extends CustomPainter{
  // 设置画笔颜色
  Paint getColoredPaint(Color color){
    Paint paint = new Paint();
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {    // 绘制逻辑
    double wheelSize = min(size.height, size.width) / 2;
    double nbElm  = 6;    // 分成 6 份
    double radius = (2 * pi) / nbElm;    // 六分之一圆
    // 包裹这个圆形的矩形
    Rect boundingRect = Rect.fromCircle(center: Offset(wheelSize,wheelSize), radius: wheelSize);
    // 每次画六分之一的扇形
    canvas.drawArc(boundingRect, 0, radius, false, getColoredPaint(Colors.green));
    canvas.drawArc(boundingRect, radius, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(boundingRect, radius * 2, radius, false, getColoredPaint(Colors.yellow));
    canvas.drawArc(boundingRect, radius * 3, radius, true, getColoredPaint(Colors.purple));
    canvas.drawArc(boundingRect, radius * 4, radius, false, getColoredPaint(Colors.blue));
    canvas.drawArc(boundingRect, radius * 5, radius, true, getColoredPaint(Colors.orange));
  }

  // 判断是否需要重绘，这里我们简单的做下比较即可
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

class Cake extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200,200),
      painter: WheelPainter(),
    );
  }
}