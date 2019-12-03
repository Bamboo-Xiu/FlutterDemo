import 'package:flutter/material.dart';
import 'package:flutter_app1/dataTransfer/count_container.dart';
import 'package:flutter_app1/dataTransfer/event_bus_page.dart';
import 'package:flutter_app1/dataTransfer/notification_widget.dart';

class DataTransferDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page'
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  MyHomePage({Key key, this.title}) : super(key:key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            CounterPage(),
            NotificationWidget(),
            FirstPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home),text: 'InheritedWidget',),
            Tab(icon: Icon(Icons.rss_feed),text: 'Notification',),
            Tab(icon: Icon(Icons.perm_identity),text: 'EventBus',)
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}