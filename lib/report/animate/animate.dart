import 'package:flutter/material.dart';
class Animate extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画特效",style: TextStyle(color: Colors.white)),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.blue,
      ),
      body: Center(child:Text('动画特效'))
      
    );
  }
}



