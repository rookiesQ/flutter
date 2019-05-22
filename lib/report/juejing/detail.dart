import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hk_app/util/http.dart';
import 'dart:convert';
import 'package:flutter_html_view/flutter_html_view.dart';
class Detail extends StatefulWidget {
  final list;
  Detail({this.list}):super();
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String content = '';
  @override
  void initState(){
    super.initState();
    getData();
  }
  void getData() {
    getArticleDetail(objectId:widget.list['objectId']).then((res){
      Map<String, dynamic> json = jsonDecode(res.toString());
       setState(() {
         content = '<body>'+json['d']['content']+'</body>';
       });
      
      print(content);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('详情页'),),
      body: new HtmlView(data:content),
    );
  }
}