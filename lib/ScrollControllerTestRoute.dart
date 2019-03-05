import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget{

}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute>{
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;    //是否显示“返回到顶部”按钮

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener((){
      print(_controller.offset);    //打印滚动位置
      if(_controller.offset <1000 && showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if(_controller.offset >=1000 && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }
}