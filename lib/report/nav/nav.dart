import 'package:flutter/material.dart';
class Nav extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航栏",style: TextStyle(color: Colors.white)),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.blue,
      ),
      body: Center(child:Text('导航特效'))
      
    );
  }
}



