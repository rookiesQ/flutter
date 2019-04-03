import 'package:flutter/material.dart';
class HomeIntelligent extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("智能巡店",style: TextStyle(color: Colors.black),),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text("这是智能巡店")
      )
    );
  }
}