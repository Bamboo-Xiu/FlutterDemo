import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';    // path_provider: '>0.5.0'
import 'package:shared_preferences/shared_preferences.dart';    // shared_preferences: ^0.5.0
import 'package:sqflite/sqflite.dart';    // sqflite:
import 'package:path/path.dart';    // 路径链接拼接

class DataPersistenceDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DataPersistence Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: DataPersistenceHomePage(title: "DataPersistence HomePage"),
    );
  }
}

class DataPersistenceHomePage extends StatefulWidget{
  final String title;
  DataPersistenceHomePage({Key key, this.title}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DataPersistenceHomePageState();
  }
}

class _DataPersistenceHomePageState extends State<DataPersistenceHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('文件 Demo'),
              onPressed: ()=>fileDemo(),
            ),
            RaisedButton(
              child: Text('SharedPreference Demo'),
              onPressed:  ()=>spDemo(),
            ),
            RaisedButton(
              child: Text('数据库 Demo'),
              onPressed:  ()=>dbDemo(),
            )
          ],
        ),
      ),
    );
  }

  // 加载 App 文件目录
  Future<File> get _loadFile async{    // 这里的 get 关键字表明，可以通过 对象._loadFile 来调用此方法
    final directory = await getApplicationDocumentsDirectory();    // 获取 App 文件目录，只有 App 卸载之后才会销毁
    final path = directory.path;
    return File('$path/content.txt');
  }

  // 往 App 中写入内容
  Future<File> _writeFileContent(String content) async{
    final file = await _loadFile;
    return file.writeAsString(content);
  }

  // 读取文件中的内容
  Future<String> _readFileContent() async{
    try{
      final file = await _loadFile;
      String content = await file.readAsString();
      return content;
    }catch(e){
      return "";
    }
  }

  // 文件操作的方法
  fileDemo(){
    _readFileContent().then((value){
      print('before: $value');
      _writeFileContent('$value .哈哈哈').then((_){
        _readFileContent().then((value)=>print('after:$value'));
      });
    });
  }


  // SharedPreference 数据库 读取数据
  Future<int> _readSPCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt("counter") ?? 0);
    return counter;
  }
  // SharedPreference 数据库 写入数据
  Future<void> _writeSPCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', counter);
  }
  // SharedPreference 数据库 Demo
  spDemo(){
    _readSPCounter().then((value){
      print('before: $value');
      _writeSPCounter().then((_){
        _readSPCounter().then((value){
          print('after:$value');
        });
      });
    });
  }


  //数据库 Demo
  int studentID = 123;
  dbDemo() async{
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'students_database.db'),    // 拼接目录路径
      onCreate: (db, version)=>db.execute('CREATE TABLE students(id TEXT PRIMARY KEY, name TEXT, score INTEGER)'),
      onUpgrade: (db, oldVersion, newVersion){
        print('oldVersion: $oldVersion   newVersion: $newVersion');
      },
      version: 1
    );

    // 增
    Future<void> insertStudent(Student std) async{
      final Database db = await database;
      await db.insert(
        'students',
        std.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );
    }

    Future<void> rawInsertStudent(Student std) async{    // 不知道为啥总是报错
      final Database db = await database;
      db.transaction((txn)async{
        await txn.rawInsert(
          'INSERT INTO students(id, name, score) VALUES(${std.id}, ${std.name}, ${std.score})'
        );
      });
    }

    // 输出数据库所有学生数据
    Future<List<Student>> students() async{
      final Database db = await database;
      final List<Map<String, dynamic>> maps = await db.query('students');
      return List.generate(maps.length, (i)=> Student.fromJson(maps[i]));
    }

    var student1 = Student(id: '${++studentID}', name: '张三', score: 90);
    var student2 = Student(id: '${++studentID}', name: '李四', score: 80);
    var student3 = Student(id: '${++studentID}', name: '王五', score: 85);

    await insertStudent(student1);
    await insertStudent(student2);
    await insertStudent(student3);

    students().then((list)=>list.forEach((stu)=>print('id = ${stu.id}, name = ${stu.name}')));

    final Database db = await database;
    db.close();
  }
}


// 实体类
class Student{
  String id;
  String name;
  int score;

  Student({this.id, this.name, this.score});
  factory Student.fromJson(Map<String, dynamic> parsedJcon){
    return Student(
      id:parsedJcon['id'],
      name: parsedJcon['name'],
      score: parsedJcon['score']
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'score': score};
  }
}



