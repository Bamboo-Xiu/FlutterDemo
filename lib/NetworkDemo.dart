import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;    // 在 pubspec.yaml 添加 http: ^0.12.0
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

class NetworkDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetworkHomePage(title: 'Network Demo HomePage'),
    );
  }
}

class NetworkHomePage extends StatefulWidget{
  final String title;
  NetworkHomePage({Key key, this.title}) : super(key: key);

  _NetworkHomePageState createState()=> _NetworkHomePageState();
}

class _NetworkHomePageState extends State<NetworkHomePage>{

  httpClientDemo() async{
    print('#### HttpClient ####');
    try {
      // 创建网络调用示例，设置通用请求行为（超时时间）
      var httpClient = HttpClient();
      httpClient.idleTimeout = Duration(seconds: 5);
      // 构造 URI，设置 user-agent 为 "Custom-UA"
      var uri = Uri.parse("https://flutter.dev");
      var request = await httpClient.getUrl(uri);
      request.headers.add("user-agent", "Custom-UA");
      // 发起请求，等待响应
      var response = await request.close();

      // 收到响应，打印结果
      print('Response code: ${response.statusCode}');
      if (response.statusCode == HttpStatus.ok) {
        print(await response.transform(utf8.decoder).join());
      } else {
        print('Error: \nHttp status ${response.statusCode}');
      }
    }
    catch(e){
      print('Error:$e');
    }
    print('#### HttpClient ####');
  }


  httpDemo() async{
    print('#### http ####');
    try{
      // 创建网络调用示例
      var client = http.Client();
      // 构造 URI
      var uri = Uri.parse("https://flutter.dev");
      // 设置 user-agent 为 "Custom-UA"，随后立即发出请求
      http.Response response = await client.get(uri, headers: {"user-agent": "Custom-UA"});
      // 打印请求结果
      print('Response code:${response.statusCode}');
      if(response.statusCode == HttpStatus.ok){
        print('response.body = ' + response.body);
      }else {
        print('Error: \nHttp status ${response.statusCode}');
      }
    }
    catch(e){
      print('Error:$e');
    }
    print('#### http ####');
  }


  dioDemo() async{
    print('#### dio ####');
    try{
      Dio dio = new Dio();
      var response = await dio.get('https://flutter.dev', options: Options(headers: {'user-agent' : 'Custom-UA'}));
      print('Response code:${response.statusCode}');
      if(response.statusCode == HttpStatus.ok){
        print(response.data.toString());
      }else{
        print('Error: \nHttp status ${response.statusCode}');
      }
    }
    catch(e){
      print('Error:$e');
    }
    print('#### dio ####');
    // 创建 URI、设置 Header 及发出请求的行为，都是通过 dio.get 方法实现的。这个方法的
    // options 参数提供了精细化控制网络请求的能力，可以支持设置 Header、超时时间、Cookie、
    // 请求方法等。
  }

  dioUploadDownloadDemo() async {
    Dio dio = new Dio();
    // 使用 FormData 表单构建待上传文件
    FormData formData = FormData.fromMap({
      'file1' : File('./file1.txt'),
//      'file2' : UploadFileInfo(File('./file2.txt'),'file2.txt'), // 此种写法报错，不知为何
    });
    // 通过 post 方法发送至服务端
    var responseY = await dio.post('http://xxxxx.com/upload', data: formData);
    print(responseY.toString());
    // 使用 download 方法下载文件
    dio.download('http://xxxxx.com/download/file1', 'xxx.zip');
    // 增加下载进度回调函数
    dio.download('http://xxxxx.com/download/file2', 'xxx.zip', onReceiveProgress: (count, total){
      // do something 一般来说就是画进度图
    });
  }

  dioParallDemo() async {
    print('#### dio Parallel ####');
    try{
      Dio dio = new Dio();
      List<Response> responseX = await Future.wait([
        dio.get("https://flutter.dev"),
        dio.get("https://pub.dev/packages/dio")
      ]);

      // 打印请求 1 响应结果
      print('Response1: ${responseX[0].toString()}');
      // 打印请求 2 响应结果
      print('Response2: ${responseX[1].toString()}');
    }catch(e){
      print('Error: $e');
    }
    print('#### dio Parallel ####');
  }

  dioInterceptorReject() async{
    print('#### dioInterceptorReject ####');
    Dio dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        return dio.reject('Error: 拦截的原因');
      }
    ));
    try{
      var response = await dio.get("https://flutter.dev");
      print(response.data.toString());
    }catch(e){
      print('Error: $e');
    }
    print('#### dioInterceptorReject ####');
  }

  dioInterceptorCache() async{
    print('#### dioInterceptorCache ####');
    Dio dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        return dio.resolve("返回缓存数据");
      }
    ));
    try{
      var response = await dio.get("https://flutter.dev");
      print(response.data.toString());
    }catch(e){
      print('Error: $e');
    }
    print('#### dioInterceptorCache ####');
  }

  dioInterceptorCustomHeader() async{
    print('#### dioInterceptorCustomHeader ####');
    Dio dio = new Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        options.headers['user-agent'] = 'Custom-UA';
        return options;
      }
    ));
    try{
      var response = await dio.get('https://wwww.baidu.com');
      print(response.data.toString());
    }catch(e){
      print('Error: $e');
    }
    print('#### dioInterceptorCustomHeader ####');
  }

  String jsonString = '''
    {
      "id":"123",
      "name":"张三",
      "score":95,
      "teacher":
        {
          "name":"李四",
          "age":40
        }
    }
  ''';

  static Student parseStudent(String content){
    final jsonResponse = json.decode(content);
    Student student = Student.fromJson(jsonResponse);
    return student;
  }

  // 如果 JSON 的数据格式比较复杂，数据量又大，这种解析方式可能会造成短期 UI 无法响应，这时
  // 可以使用 compute 函数，将解析工作放到新的 Isolate 中完成
  Future<Student> loadStudent(){
    return compute(parseStudent, jsonString);
  }

  jsonParseDemo(){
    loadStudent().then((s){
      String content = '''
      name:${s.name}
      score:${s.score}
      teacher:${s.teacher.name}
      ''';
      print(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('HttpClient Demo'),
              onPressed: ()=>httpClientDemo(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('http Demo'),
              onPressed: ()=>httpDemo(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('Dio Demo'),
              onPressed: ()=>dioDemo(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('Dio 并发 Demo'),
              onPressed: ()=>dioParallDemo(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('Dio 拦截'),
              onPressed: ()=>dioInterceptorReject(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('Dio 缓存'),
              onPressed: ()=>dioInterceptorCache(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('Dio 自定义 header'),
              onPressed: ()=>dioInterceptorCustomHeader(),
            ),
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.cyan,
              colorBrightness: Brightness.dark,
              child: Text('JSON 解析 Demo'),
              onPressed: ()=>jsonParseDemo(),
            ),
          ),
        ],
      ),
    );
  }
}


class Student{
  String id;
  String name;
  int score;
  Teacher teacher;

  Student({this.id, this.name, this.score, this.teacher});
  // JSON 解析工厂类，使用字典数据为对象初始化赋值
  factory Student.fromJson(Map<String, dynamic> parsedJson){
    return Student(
      id: parsedJson['id'],
      name: parsedJson['name'],
      score: parsedJson['score'],
      // 增加映射规则
      teacher: Teacher.fromJson(parsedJson['teacher'])
    );
  }
}


class Teacher{
  String name;
  int age;
  Teacher({this.name, this.age});

  factory Teacher.fromJson(Map<String, dynamic> parsedJson){
    return Teacher(
      name: parsedJson['name'],
      age: parsedJson['age']
    );
  }
}