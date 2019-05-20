import 'package:flutter/material.dart';
import 'package:hk_app/common/wordList.dart';
class HomeMy extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    //var screenSize;
        return Scaffold(
          appBar: AppBar(
            title: Text('word'),
            backgroundColor: Colors.cyan,
          ),
          body:WordList()
    );
  }
}