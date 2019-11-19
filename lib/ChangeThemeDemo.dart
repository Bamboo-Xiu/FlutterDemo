import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeThemeDemo extends StatelessWidget{
  
  // iOS 浅色主题
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.white,
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(color: Colors.grey),
    textTheme: TextTheme(body1: TextStyle(color: Colors.black))
  );
  
  // Android 深色主题
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: Colors.black,
    primaryColor: Colors.cyan,
    iconTheme: IconThemeData(color: Colors.blue),
    textTheme: TextTheme(body1: TextStyle(color: Colors.red))
  );
  
  @override
  Widget build(BuildContext context) {
    var theme = MyTheme(
      title:'Flutter Demo Home Page',
      themes: [lightTheme, darkTheme],
    );
    return MaterialApp(
      title: 'My Theme',
      theme: darkTheme,
      home: theme,
    );
  }
}

class MyTheme extends StatefulWidget{
  MyTheme({Key key, this.title, this.themes}): super(key: key);
  
  final String title;
  final List<ThemeData> themes;
  
  _MyThemeState createState() => _MyThemeState();
}

class _MyThemeState extends State<MyTheme>{
  bool isLight;
  
  @override
  void initState() {
    isLight = true;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Theme switch'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text(isLight ? 'Night' : 'Light'),
          onPressed: (){
            setState(() {
              isLight = !isLight;
            });
          },
        ),
      ),
      data: isLight ? widget.themes[0] : widget.themes[1],
    );
  }
}