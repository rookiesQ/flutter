import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hk_app/util/http.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Detail extends StatefulWidget {
  final list;
  Detail({this.list}):super();
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState(){
   print(widget.list.toString());
    super.initState();
    getArticleDetail(objectId:widget.list['objectId']).then((res){
      
    });
  }
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.list['user']['username']),
      ),
      url: widget.list['originalUrl']
    );
  }
}