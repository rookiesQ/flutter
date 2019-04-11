import 'package:flutter/material.dart';
import 'package:hk_app/launch.dart';
import 'package:hk_app/login/login.dart';
class App extends StatefulWidget{
  @override
  _AppStateWidget createState()=> new _AppStateWidget();
}
class _AppStateWidget extends State<App> {
  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Welcom to Flutter',
          theme: new ThemeData(
            primaryColor: Colors.white
          ),
          initialRoute: '/launch',
          routes: {
            '/': (BuildContext context) => new SplashScreen(),
            '/launch': (BuildContext context) => new SplashScreen(),
            '/login': (BuildContext context) => new LoginView(),
          },
          
    );
  }
}

