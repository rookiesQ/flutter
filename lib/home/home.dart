import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../home/home_index.dart';
import './home_my.dart';
import '../report/juejing/index.dart';
import 'package:hk_app/report/intimate/intimate.dart';


class HomeApp extends StatefulWidget{
    @override
    HomeAppState createState() => HomeAppState();
}
class HomeAppState extends State<HomeApp> {
    bool showHead = true;
    final drawHeader = DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Center(
        child: SizedBox(
          width: 60,
          height:60,
          child: CircleAvatar(
            child:Text('qiang',style:TextStyle(color:Colors.white))
          )
        )
      )
    );
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
                child: ListView(
                  children: <Widget>[
                    drawHeader,
                    InkWell(
                      onTap: () {
                        print(RouteObserver());
                       Navigator.of(context).pushNamed('flutter');
                      },
                      child: Container(
                        padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(
                              color: Color(0xFFf2f2f2)
                            )
                          )
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(IconData(59530, fontFamily: 'MaterialIcons'),size:20,color:Colors.purple),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("flutter中文网",style: TextStyle(fontSize: 14),),
                            ),
                            Expanded(
                              child:  Container(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                    IconData(58828, fontFamily: 'MaterialIcons',),size:26,color:Color(0xFFdddddd)
                                ),
                              )
                            )
                          ],
                        )
                    
                      )
                    ),
                    InkWell(
                      onTap: () {
                        print(RouteObserver());
                        Navigator.of(context).pushNamed('typescript');
                      },
                      child: Container(
                        padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(
                              color: Color(0xFFf2f2f2)
                            )
                          )
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.bookmark,size:20,color:Color.fromRGBO(229, 93, 124, 1)),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text("typescript中文网",style: TextStyle(fontSize: 14),),
                            ),
                            Expanded(
                              child:  Container(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                    IconData(58828, fontFamily: 'MaterialIcons',),size:26,color:Color(0xFFdddddd)
                                ),
                              )
                            )
                          ],
                        )
                    
                      )
                    ),
                    
                  ],
                )
              ),
              body: new HomeWidget(callBack: (value) => setHead(value)),
              resizeToAvoidBottomPadding: false,
            ),
            routes: <String, WidgetBuilder>{
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