import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget{
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;

  TabController _tabController;    //需要定义一个Controller
  List tabs = ["推荐","新闻","历史","图片"];

  @override
  void initState() {
    super.initState();
    //创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);

    _tabController.addListener((){
      switch(_tabController.index){
        case 1:

        case 2:
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(    //导航栏
        title: Text("App Name"),
        actions: <Widget>[    //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
        ],
        centerTitle: true,    //标题设置居中
        elevation: 9.0,    //导航栏下面的阴影大小
        leading: Builder(builder: (context){    //导航栏最左侧widget，常见为抽屉菜单按钮或返回按钮
          return IconButton(
            icon: Icon(Icons.dashboard,color:Colors.white),    //自定义图标
            onPressed: (){
              //打开抽屉菜单
              Scaffold.of(context).openDrawer();//获取父级最近的Scaffold Widget的State对象
            },
          );
        }),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=>Tab(text: e,)).toList(),
        ),
      ),
      drawer: new MyDrawer(),    //左侧抽屉
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5,),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(    //底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(    //悬浮按钮
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){

  }

}

class MyDrawer extends StatelessWidget{
  const MyDrawer({
    Key key,
    }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removeViewInsets(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          "images/avatar.png",
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Manage accounts"),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}