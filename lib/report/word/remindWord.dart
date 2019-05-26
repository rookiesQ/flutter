import 'package:flutter/material.dart';
class RemindWord extends StatelessWidget{
  final saveWord;
  final list = <Widget>[];
  RemindWord({this.saveWord}):super();
  
  @override
  Widget build (BuildContext context) {
    print(saveWord);
    var list1  = saveWord.map(
      (pair) {
        
        list.add(
          ListTile(
            title:Text(pair.toString())
          )
        );
        return pair;
      },
    );
    print(list1.toList());
    //var screenSize;
        return Scaffold(
          appBar: AppBar(
            title: Text('word'),
            backgroundColor: Colors.cyan,
          ),
          body:list.length == 0 ? Center(child:Text('暂无数据')) : new ListView(children:list)
    );
  }
}