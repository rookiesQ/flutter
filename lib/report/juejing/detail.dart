import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Detail extends StatefulWidget {
  //final list;
  //Detail({this.list}):super();
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState(){
   // print(widget.list);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页')
      ),
      body: Center(child:Text('详情页')),
    );
  }
}