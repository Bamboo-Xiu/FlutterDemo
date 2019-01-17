import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("New route"),
      ),
      body:Center(
        child:Text("This is new route"),
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
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          )
        ),
        width: 200.0,
        height: 200.0,
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
        height: 100.0,
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