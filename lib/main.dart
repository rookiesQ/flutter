import 'package:flutter/material.dart';
import 'package:hk_app/launch.dart';
import './loading.dart';
import 'package:flutter/services.dart';
import 'package:hk_app/home/home.dart';
import 'package:hk_app/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YY Dashboard",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light
      ),
      routes: <String, WidgetBuilder>{
        "home": (BuildContext context) => new HomeApp(),
        "splash": (BuildContext context) => new SplashScreen(),
        "login": (BuildContext context) => new LoginView()
      },
      home: new LoadingPage(),
    );
  }
}
