import 'package:flutter/material.dart';
import 'package:flutter_app1/AsyncDemo.dart';
import 'package:flutter_app1/ChangeThemeDemo.dart';
import 'package:flutter_app1/CustomPainterDemo.dart';
import 'package:flutter/foundation.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app1/GestureDemo.dart';
import 'package:flutter_app1/NetworkDemo.dart';
import 'package:flutter_app1/dataTransfer/DataTransferDemo.dart';
import 'package:flutter_app1/questionList/QuestionListRoot.dart';

import 'NewRoute.dart';
import 'package:english_words/english_words.dart';
import 'CupertinoTestRoute.dart';
import 'buttonWidget.dart';
import 'ImageWidget.dart';
import 'InputTestRoute.dart';
import 'RowColumnTestRoute.dart';
import 'FlexLayoutTestRoute.dart';
import 'StackPositionedRoute.dart';
import 'PaddingTestRoute.dart';
import 'ScaffoldRoute.dart';
import 'ListViewRoute.dart';
import 'InfiniteListViewRoute.dart';
import 'GridViewRoute.dart';
import 'InfiniteGridViewRoute.dart';
import 'CustomScrollViewTestRoute.dart';
import 'ScrollControllerTestRoute.dart';
import 'ScrollNotificationTestRoute.dart';
import 'WillPopScopeTestRoute.dart';
import 'CustomScrollViewTestRoute2.dart';
import 'updateItem/UpdateItemMain.dart';
import 'RouterDemo.dart';
import 'animationDemo/AnimationDemo.dart';
import 'DataPersistenceDemo.dart';
import 'NativeMethodDemo.dart';

void main() {
  /// 视觉调试开关
  debugPaintSizeEnabled = false;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  // iOS 浅色主题
  final ThemeData kIOSTheme = ThemeData(
      brightness: Brightness.dark,    // 深色主题
      accentColor: Colors.black,    // (按钮)Widget 前景色为黑色
      primaryColor: Colors.cyan,    // 主题色为青色
      iconTheme: IconThemeData(color: Colors.blue),    // icon 主题色为蓝色
      textTheme: TextTheme(body1: TextStyle(color: Colors.red))    // 文本主题色为红色
  );

  // Android 深色主题
  final ThemeData kAndroidTheme = ThemeData(
      brightness: Brightness.light,    // 亮色主题
      accentColor: Colors.white,    // (按钮)Widget 前景色为白色
      primaryColor: Colors.blue,    // 主题色为蓝色
      iconTheme: IconThemeData(color: Colors.grey),    // icon 主题为灰色
      textTheme: TextTheme(body1: TextStyle(color: Colors.black))    // 文本主题为黑色
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kAndroidTheme,
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      //注册路由表
      routes:{
        "new_page":(context)=>NewRoute(),
        "cupertino_page":(context)=>CupertinoTestRoute(),
        "image_widget":(context)=>ImageWidget(),
        "input_test_route": (context)=>InputTestRoute(),
        "row_column_route": (context)=>RowColumnTestRoute(),
        "router_demo": (context)=> RouterDemo(),
        "animation_demo": (context)=> AnimationDemo(),
        "async_demo": (context)=> AsyncDemo(),
        "network_demo": (context)=> NetworkDemo(),
        "datapersistence_demo": (context)=> DataPersistenceDemo(),
        "nativemethod_demo": (context)=> NativeMethodDemo(),

      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Scrollbar(    //默认滚动条
        child: SingleChildScrollView(    //可滚动的布局
          reverse: false,
          padding: EdgeInsets.all(10.0),
          child: new Center(
            child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('现在时刻是：' + formatDate(DateTime.now(),[yyyy,'年',mm,'月',dd,'日',hh,':',n])),
                new Text(
                  'You have pushed the button this many times:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                Container(
                  color: Theme.of(context).primaryColor,    // 容器背景色复用应用主题色
                  child: Text(
                    'Text with a background color',
                    style: Theme.of(context).textTheme.title, // Text 组件文本样式复用应用文本样式
                  ),
                ),
                FlatButton(
                  child: Text("open new route"),
                  textColor: Colors.blue,
                  onPressed: () {
                    //导航到新路由-方法一
                    Navigator.pushNamed(context,"new_page");
                  },
                ),
                FlatButton(
                  child: Text("open cupertino page"),
                  textColor: Colors.amber,
                  onPressed: (){
                    //导航到新路由-方法二
                    Navigator.push(context,
                        new MaterialPageRoute(builder:(context){
                          return CupertinoTestRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open image widget"),
                  color: Colors.blue,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.pushNamed(context, "image_widget");
                  },
                ),
                RaisedButton(
                  child: Text("open input widget"),
                  color: Colors.blue,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.pushNamed(context, "input_test_route");
                  },
                ),
                new RandomWordsWidget(),
//            new Echo(text:"hiahiahiahia~")
                new TapboxA(),
//            new ParentWidget(),
                new ParentWidgetC(),
                FlatButton(
                  child: Text("open button and Container widget page"),
                  textColor: Colors.red,
                  onPressed: (){
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context){
                          return buttonWidget();
                        }));
                  },
                ),
            RaisedButton(
              child: Text("open Row and Column widget"),
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              onPressed: (){
                Navigator.pushNamed(context, "row_column_route");
              },
            ),
            RaisedButton(
              child: Text("open FlexLayout"),
              color: Colors.green,
              colorBrightness: Brightness.dark,
              onPressed: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context){
                    return FlexLayoutTestRoute();
                  })
                );
              },
            ),
            RaisedButton(
              child: Text("open Stack Positioned"),
              color: Colors.green,
              colorBrightness: Brightness.dark,
              onPressed: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context){
                      return StackPositionedRoute();
                    })
                );
              },
            ),
            RaisedButton(
              child: Text("open Padding Transform DecoratedBox Route"),
              color: Colors.green,
              colorBrightness: Brightness.dark,
              onPressed: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context){
                      return PaddingTestRoute();
                    })
                );
              },
            ),
                RaisedButton(
                  child: Text("open Scaffold Route"),
                  color: Colors.green,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return ScaffoldRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open ListView Route"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return ListViewRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open InfiniteListView Route"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return InfiniteListView();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open GrideViewRoute"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return GridViewRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open InfiniteGrideViewRoute"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return InfiniteGridView();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open CustomScrollViewTestRoute"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return CustomScrollViewTestRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open CustomScrollViewTestRoute2"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return CustomScrollViewTestRoute2();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open ScrollControllerTestRoute"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return ScrollControllerTestRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open ScrollNotificationTestRoute"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return ScrollNotificationTestRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open WillPopScopeTestRoute"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return WillPopScopeTestRoute();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open UpdateItemDemo"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return UpdateItemMain();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open CustomPainterDemo"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return CustomPainterDemo();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: Text("open ChangeThemeDemo"),
                  color: Colors.cyan,
                  colorBrightness: Brightness.dark,
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return ChangeThemeDemo();
                        })
                    );
                  },
                ),
                Container(
                  width: double.infinity,    // 宽度充满父布局
                  child: RaisedButton(
                    child: Text("open QuestionList"),
                    color: Colors.cyan,
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context){
                            return QuestionListRoot();
                          })
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open GestureDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context){
                          return GestureDemo();
                        })
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open DataTransferDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context){
                            return DataTransferDemo();
                          })
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open RouterDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.pushNamed(context, "router_demo");
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open AnimationDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.pushNamed(context, "animation_demo");
                    },
                  ),
                ),
                Container(
                  width:double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open AsyncDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.pushNamed(context, "async_demo");
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open NetworkDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.pushNamed(context, "network_demo");
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text('open DataPersistenceDemo'),
                    colorBrightness: Brightness.dark,
                    onPressed: (){
                      Navigator.pushNamed(context, "datapersistence_demo");
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text("open NativeMethodDemo"),
                    onPressed: (){
                      Navigator.pushNamed(context, "nativemethod_demo");
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}


class Echo extends StatelessWidget{
  final String text;
  final Color backgroundColor;

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.amberAccent
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        color:backgroundColor,
        child: Text(text),
      )
    );
  }
}