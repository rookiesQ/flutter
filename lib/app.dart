import 'package:flutter/material.dart';
import 'package:hk_app/launch.dart';
import 'package:hk_app/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class App extends StatefulWidget{
  @override
  _AppStateWidget createState()=> new _AppStateWidget();
}
class _AppStateWidget extends State<App> {
  var defaultRoute = null;
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 2),(){
      loadIsFirst();
    });    
  }
  void loadIsFirst () async{
    SharedPreferences  pref = await SharedPreferences.getInstance();
    bool isFirst = pref.getBool("hasSkip");
    setState((){
      if (isFirst== null|| !isFirst) {
        defaultRoute = "/";
      } else {
       defaultRoute = "/login";
      }
      print(isFirst);
      print(defaultRoute);
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

