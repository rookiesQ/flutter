import 'package:flutter/material.dart';
import '../home/home_index.dart';
import '../home/home_page.dart';
import 'package:hk_app/login/login.dart';
// 引入列表组件
import 'package:hk_app/report/list/list.dart';
// 引入nav组件
import 'package:hk_app/report/nav/nav.dart';
// 引入列表组件
import 'package:hk_app/report/animate/animate.dart';
// 引入列表组件
import 'package:hk_app/report/web/webView.dart';
 // 获取设备信息
import 'package:package_info/package_info.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeApp extends StatefulWidget{
    @override
    HomeAppState createState() => HomeAppState();
}
class HomeAppState extends State<HomeApp> {
    bool showHead = true;
    @override
    void initState() {
      print(showHead);
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
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/common/bsbg.png"),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Container(
                        height: 180,
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/images/common/my_portrait.png"),
                              width: 60,
                              height: 60,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                              "彭晓飞",
                              style: TextStyle(
                                fontSize:20,
                                color: Colors.white
                              ),
                            ) 
                          )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(
                              color: Color(0xFFf2f2f2)
                            )
                          )
                        ),
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Icon(IconData(57345, fontFamily: 'MaterialIcons'),size:28,color:Color(0xFF03a9f4)),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text("版本号",style: TextStyle(fontSize: 14),),
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
                          ),
                        ),
                      ),
                      onTap:() {
                        PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
                              Fluttertoast.showToast(
                                msg: packageInfo.version,
                                 gravity: ToastGravity.CENTER
                              );
                              print(packageInfo);
                            });
                      }
                    ),
                InkWell(
                  onTap: () {
                      Navigator.of(context).pushNamed("intimate");
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
                        Icon(IconData(59568, fontFamily: 'MaterialIcons'),size:28,color:Color.fromRGBO(245, 195, 68, 1)),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text("隐私协议",style: TextStyle(fontSize: 14),),
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
                /*Container(
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
                       Icon(IconData(58154, fontFamily: 'MaterialIcons'),size:28,color:Color.fromRGBO(65, 133, 246, 1)),
                       Container(
                         margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                         child: Text("修改密码",style: TextStyle(fontSize: 14),),
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
                  ), 
                ),*/InkWell(
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
                        Icon(IconData(59564, fontFamily: 'MaterialIcons'),size:28,color:Colors.red[900]),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text("注销",style: TextStyle(fontSize: 14),),
                        ),
                        Expanded(
                          child:  Container(
                            alignment: Alignment.bottomRight,
                            
                            child: Icon(
                                IconData(58828, fontFamily: 'MaterialIcons'),size:26,color:Color(0xFFdddddd),
                               
                            ),
                          )
                        )
                      ],
                    )
                  ),
                  onTap: (){
                       Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (context) => new LoginView()),
                        (route) => route == null);  

                  },
                )
                  ],
                )
              ),
              body: new HomeWidget(callBack: (value) => setHead(value)),
              resizeToAvoidBottomPadding: false,
            ),
            routes: <String, WidgetBuilder>{
              "/list": (_) => ListViews(),
              "/nav": (_) => Nav(),
              "/animate": (_) => Animate(),
              '/web':(_) => WebViewPage(title: '掘金',url: 'https://juejin.im/'),
              '/it':(_) => WebViewPage(title: 'it之家',url: 'https://www.ithome.com/'),
             
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
      ..add( HomeMy());
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
            title:Text('喜好',style: TextStyle(fontSize: 14.0))
          ),BottomNavigationBarItem(
            icon: Icon(IconData(0xe61e,fontFamily:'AppIconFonts'),size:20),
            title:Text('页面',style: TextStyle(fontSize: 14.0))
          )
        ]
      ),
    );
  }
}

//export PATH=/Users/lubangqiang/development/flutter/bin:$PATH