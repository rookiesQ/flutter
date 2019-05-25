import 'package:flutter/material.dart';
import '../home/home_index.dart';
import './home_my.dart';
import '../report/juejing/index.dart';
import 'package:hk_app/report/intimate/intimate.dart';
// 引入列表组件
import 'package:hk_app/report/web/webView.dart';

class HomeApp extends StatefulWidget{
    @override
    HomeAppState createState() => HomeAppState();
}
class HomeAppState extends State<HomeApp> {
    bool showHead = true;
    
    @override
    void initState() {
      
      super.initState();
    }
    
    void setHead(val) {
      setState(() {
        showHead = val;
      });
    }
    @override
    Widget build(BuildContext context) {
          return new MaterialApp(
            title: 'Welcom to Flutter',
            debugShowCheckedModeBanner: false,  // 设置这一属性即可
            theme: new ThemeData(
              primaryColor: Colors.blue
            ),
            home: new Scaffold(
              appBar: showHead ? AppBar(
                title: Text("首页",style: TextStyle(color: Colors.white),),
                brightness: Brightness.light,
                centerTitle: true,
                elevation: 0.5
              ): null,
              drawer: new Drawer(
                child: Text('12')
              ),
              body: new HomeWidget(callBack: (value) => setHead(value)),
              resizeToAvoidBottomPadding: false,
            ),
            routes: <String, WidgetBuilder>{
              '/typescript':(_) => WebViewPage(title: 'TypeScript学习',url: 'https://www.tslang.cn/'),
              '/flutter':(_) => WebViewPage(title: 'Flutter中文网',url: 'https://flutterchina.club/'),
               "intimate": (BuildContext context) => new Intimate()
            },
            
      );
    }
}
class HomeWidget extends StatefulWidget{
  HomeWidget({
    Key key,this.callBack
  }): super(key: key);
  final callBack;
  @override
  _HomeWidgetState createState() => new _HomeWidgetState();
}
class _HomeWidgetState extends State<HomeWidget>{
  final List<Widget> list = List();
  int _currentIndex = 0;
  @override
  void initState() {
    list 
      ..add(HomeKpi())
      ..add(ListViews())
      ..add(HomeMy());
      super.initState();
  }
  Widget build(BuildContext content){
    return Scaffold(
      body:list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 0) {
              widget.callBack(true);
            } else {
               widget.callBack(false);
            }
          });
        },
        type:BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe6ce,fontFamily:'AppIconBase'),size:20),
            title:Text('首页',style: TextStyle(fontSize: 14.0))
          ),BottomNavigationBarItem(
            icon: Icon(Icons.book,size:20),
            title:Text('掘金',style: TextStyle(fontSize: 14.0))
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe61e,fontFamily:'AppIconFonts'),size:20),
            title:Text('我的',style: TextStyle(fontSize: 14.0))
          )
        ]
      ),
    );
  }
}

//export PATH=/Users/lubangqiang/development/flutter/bin:$PATH