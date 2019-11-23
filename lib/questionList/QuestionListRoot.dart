import 'package:flutter/material.dart';
import 'package:flutter_app1/main.dart';
import 'package:flutter_app1/questionList/question_1.dart';

class QuestionListRoot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'QuestionListRoot',
      home: QuestionListHomePage(title: '问题汇总页',),
      /// 注册路由表
      routes: {},
    );
  }
}

class QuestionListHomePage extends StatefulWidget{
  QuestionListHomePage({Key key,this.title}):super(key :key);
  final String title;

  _QuestionListHomePageState createState() => new _QuestionListHomePageState();
}

class _QuestionListHomePageState extends State<QuestionListHomePage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("问题汇总页"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          reverse: false,    /// 初始化位置
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Row如何展示不同高度widget'),
                  color: Colors.green,
                  colorBrightness: Brightness.light,
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context){return question_1();}));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}