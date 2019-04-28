import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Animate extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return WebviewScaffold(
              url: 'https://flutterchina.club',
              appBar: AppBar(
                title: Text('flutter中文网'),
              )
            );
      
  }
}



