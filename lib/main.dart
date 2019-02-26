import 'package:flutter/material.dart';
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

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      //注册路由表
      routes:{
        "new_page":(context)=>NewRoute(),
        "cupertino_page":(context)=>CupertinoTestRoute(),
        "image_widget":(context)=>ImageWidget(),
        "input_test_route": (context)=>InputTestRoute(),
        "row_column_route": (context)=>RowColumnTestRoute(),
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
          reverse: true,
          padding: EdgeInsets.all(10.0),
          child: new Center(
            child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
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