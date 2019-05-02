import 'package:flutter/material.dart';
import 'package:hk_app/common/tabOne.dart';
class HomeMy extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    //var screenSize;
        return Scaffold(
          appBar: AppBar(
            title: Text('word'),
            backgroundColor: Colors.cyan,
          ),
          body: TabOne()
    );
  }
}