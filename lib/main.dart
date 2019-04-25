import 'package:flutter/material.dart';
import 'package:hk_app/launch.dart';
import './loading.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:hk_app/home/home.dart';
import 'package:hk_app/login/login.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
        "login": (BuildContext context) => new LoginView(),
        "/webview": (_) => WebviewScaffold(
            url: 'https://www.baidu.com/',
            appBar: AppBar(
              title: Text("浏览网页"),
            )
        )
      },
      home: new LoadingPage(),
    );
  }
}
