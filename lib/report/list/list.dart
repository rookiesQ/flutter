import 'package:flutter/material.dart';
class ListViews extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滑动的列表",style: TextStyle(color: Colors.black),),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: Center(child:Text('列表效果'))
      
    );
  }
}



