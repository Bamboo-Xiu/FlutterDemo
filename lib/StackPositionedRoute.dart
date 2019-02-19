import 'package:flutter/material.dart';

class StackPositionedRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack and Positioned"),
      ),
      body: Center(
        child: ConstrainedBox(constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,    //未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Container(    //由于第二个字widget没有定位，所以fit属性会对它起作用，就会占满Stack
              child: Text("Hello World", style: TextStyle(color: Colors.white),),
              color: Colors.red,
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),),
      ),
    );
  }
}