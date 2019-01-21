import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{

  String icons = "";

  @override
  Widget build(BuildContext context) {
    icons += "\uE914";
    icons += " \uE000";
    icons += " \uE90D";
    return new Scaffold(
      appBar: AppBar(
        title: Text("Image and Icon"),

      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100.0
            ),
//            Image.asset("images/avatar.png",    //快捷的构造函数
//              width: 100.0,
//            ),
            Image(    //从网络加载图片
              image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 80.0,
              height: 50.0,
              fit: BoxFit.fill
            ),
//            Image.network(    //从网络加载图片的另一种写法
//              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
//              width: 100.0,
//            ),
            Text(icons,    //字体图标
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 30.0,
                color: Colors.green
              ),
            ),
            Row(    //另一种写法
              children: <Widget>[
                Icon(MyIcons.book, color: Colors.purple,),
                Icon(MyIcons.wechat,color: Colors.green,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

//自定义字体图标
class MyIcons{
  //book 图标
  static const IconData book = const IconData(
      0xe614,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
  //微信图标
  static const IconData wechat = const IconData(
      0xec7d,
      fontFamily:'myIcon',
      matchTextDirection: true
  );
}