import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.red,);

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Route"),
      ),
      body: new Center(
        /*child: ListView.builder(    // ListView.builder 用法
            itemCount: 100,
            itemExtent: 50.0,
            itemBuilder: (BuildContext context, int index){
              return ListTile(title: Text("$index"),);
            }
        ),*/

        child: ListView.separated(    // ListView.separated 用法
            //列表构造器
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                leading:Icon(Icons.map),
                title: Text("$index"),
                subtitle: Text('load # $index'),
              );
            },
            //分割器构造器
            separatorBuilder: (BuildContext context,int index){
              return index % 2 == 0 ? divider1 : divider2;
            },
            itemCount: 100
        ),
        
      ),
    );
  }
}