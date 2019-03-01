import 'package:flutter/material.dart';

class GridViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("纵轴固定数量的GridView"),
      ),
      body: new Center(
        child:GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,    //横轴三个子widget
                childAspectRatio: 1.0    //宽高比为1时，子widget
            ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ],
        ),
      ),
    );
  }
}