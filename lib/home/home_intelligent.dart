import 'package:flutter/material.dart';
import "package:hk_app/common/head.dart";
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
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          new HeaderPart(),
        ],
      )
    );
  }
}