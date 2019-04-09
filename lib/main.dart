import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Welcom to Flutter',
          theme: new ThemeData(
            primaryColor: Colors.white
          ),
          home: new Scaffold(
            body: new App()
          ),
          routes: {
            "home": (BuildContext context) => new Home(),
            "app": (BuildContext context) => new App(),
            "login": (BuildContext context) => new LoginView(),
            "/webview": (_) => WebviewScaffold(
                url: "www.baidu.com",
                appBar: AppBar(
                  title: Text("打开的网页"),
                ),
                withJavascript: true,
                withLocalStorage: true,
                withZoom: true,
            )
          }
    );
  }
}

