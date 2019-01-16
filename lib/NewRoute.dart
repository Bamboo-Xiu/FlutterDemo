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
  _ParentWidgetState createState() => new
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
    // TODO: implement build
    return new Container(
      child: new TapboxB(

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
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
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