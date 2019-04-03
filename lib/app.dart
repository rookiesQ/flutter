import 'package:flutter/material.dart';
import 'package:hk_app/launch.dart';
import 'home/home.dart';
import 'login/login.dart';
void main() => runApp(new App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Welcom to Flutter',
          theme: new ThemeData(
            primaryColor: Colors.white
          ),
          home: new Scaffold(
            body: new SplashScreen(),
            resizeToAvoidBottomPadding: false,
          ),
          routes: {
            "home": (BuildContext context) => new Home(),
            "app": (BuildContext context) => new App(),
            "login": (BuildContext context) => new LoginView()
          }
          
    );
  }
}

