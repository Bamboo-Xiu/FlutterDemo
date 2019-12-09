import 'package:flutter/material.dart';

class Page1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: GestureDetector(
        child: Row(
          children: <Widget>[
            Hero(
              tag: 'hero',
              child: Container(
                width: 100,
                height: 100,
                child: FlutterLogo(),
              ),
            ),
            Text('点击 Logo 查看 Hero 效果')
          ],
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Page2()));
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Hero(
        tag: 'hero',
        child: Container(
          width: 300,
          height: 300,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

/**
 * Hero 通过 Hero，我们可以在两个页面的共享元素之间，做出流畅的页面切换效果，
 * 两个元素要设置相同的 tag
**/