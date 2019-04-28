import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Nav extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return WebviewScaffold(
              url: 'https://www.tslang.cn/',
              appBar: AppBar(
                title: Text('typescript中文网'),
              )
     );
  }
}



