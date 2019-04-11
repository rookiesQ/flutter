import 'package:flutter/material.dart';
import 'package:hk_app/launch.dart';
import 'package:hk_app/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class App extends StatefulWidget{
  @override
  _AppStateWidget createState()=> new _AppStateWidget();
}
class _AppStateWidget extends State<App> {
  bool isFirst = false;
  String defaultRoute = '/launch';
  void initState() {
    super.initState();
     loadIsFirst();
     if (isFirst == false){
       defaultRoute = "/";
     } else {
       defaultRoute = "/login";
     }
  }
  loadIsFirst () async{
    SharedPreferences  pref = await SharedPreferences.getInstance();
    setState((){
      isFirst = pref.getBool("hasSkip");
    });
  }
  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Welcom to Flutter',
          theme: new ThemeData(
            primaryColor: Colors.white
          ),
          initialRoute: defaultRoute,
          routes: {
            '/': (BuildContext context) => new SplashScreen(),
            '/login': (BuildContext context) => new LoginView(),
          },
          
    );
  }
}

