import 'package:flutter/material.dart';
import 'app.dart';
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
            
          }
    );
  }
}

