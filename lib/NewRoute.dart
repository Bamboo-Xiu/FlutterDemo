import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("New route"),
      ),
      body:Center(
        child:new Column(
          children: <Widget>[
            new Text("Hello world" * 6,
              textAlign: TextAlign.center    //居中
              ),
            new Text("Hello world! I'm Jack." * 4,
              maxLines: 1,    //限定为一行展示
              overflow: TextOverflow.ellipsis,    //overflow来指定截断方式，展示不下就用省略号...
            ),
            new Text("Hello world",
              textScaleFactor: 1.5,    //代表文本相对于当前字体大小的缩放因子
            ),
            new Text("Hello world",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,    //用于指定行高，并不是一个绝对值，而是一个因子，具体的行高等于 fontSize * height
                fontFamily: "Courier",    //字体
                background: new Paint()..color=Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            Text.rich(TextSpan(    //Text其实就是RichText的一个包装，而RichText是可以显示多种样式(富文本)的widget。
              children: [
                TextSpan(
                  text: "Home:"
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue
                  ),
//                  recognizer: _tapRecongnizer
                )
              ]
            )),
            DefaultTextStyle(    //1、设置文案默认样式
              style: TextStyle(
                color:Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,    //左对齐
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello world"),
                  Text("I am Jack"),
                  Text("I am Jack",
                    style: TextStyle(
                      inherit: false,    //2、不继承默认样式
                      color: Colors.grey
                    ),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

/**
 * TapboxA 管理自身状态
 */
//-----------------------------------Tapbox A-----------------------------------
class TapboxA extends StatefulWidget{
  TapboxA({Key key}):super(key:key);

  @override
  _TapboxAState createState()=> new _TapboxAState();
}

class _TapboxAState extends State<TapboxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active': 'Inactive',
            style: new TextStyle(fontSize: 25.0,color: Colors.white),
          )
        ),
        width: 100.0,
        height: 50.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      )
    );
  }
}

//-----------------------------------Tapbox A-----------------------------------

/**
 * 父widget管理子widget的state
 */
// ParentWidget 为 TapboxB 管理状态
//------------------------ ParentWidget --------------------------------
class ParentWidget extends StatefulWidget{
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------
class TapboxB extends StatelessWidget{
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
  :super(key: key);

  void _handleTap(){
    onChanged(!active);
  }

  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
        width: 100.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}


/**
 * 混合管理
 */
//------------------------ ParentWidget --------------------------------
class ParentWidgetC extends StatefulWidget{
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxC ----------------------------------
class TapboxC extends StatefulWidget{
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key, key,this.active: false, @required this.onChanged})
   :super(key:key);

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC>{
  bool _hightlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _hightlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _hightlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _hightlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    //在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown,    //处理按下事件
      onTapUp: _handleTapUp,    //处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 20.0, color: Colors.white),),
        ),
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          color:widget.active ? Colors.lightBlue : Colors.grey,
          border: _hightlight
            ? new Border.all(
            color: Colors.teal[700],
            width: 5.0
          )
              : null,
        ),
      ),
    );
  }
}