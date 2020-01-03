import 'package:flutter/material.dart';

class AsyncDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AsyncDemo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('输入代码如下：'),
          ),
          Container(
            height: 300,
            child: SingleChildScrollView(
              child: Text('''new CustomScrollView(
                  shrinkWrap: true,
                  // 内容
                  slivers: <Widget>[
                  new SliverPadding(
                  padding: const EdgeInsets.all(20.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    const Text('A'),
                    const Text('B'),
                    const Text('C'),
                    const Text('D'),
                  ],
                ),
              ),
              ],
            )'''),
            ),
          )
        ],
      ),
    );
  }
}