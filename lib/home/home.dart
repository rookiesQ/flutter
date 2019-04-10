import 'package:flutter/material.dart';
import '../common/common_footer.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Welcom to Flutter1',
          theme: new ThemeData(
            primaryColor: Color.fromRGBO(70, 138, 247, 1)
          ),
          routes: {
            "/webview": (_) => new WebviewScaffold(
              url: "http://edi01.ysappstore.com:8072/web/index.html",
              appBar: new AppBar(
                title: new Text("Widget webview"),
              ),
            )
          },
          
          home: BottomNavigationWidget()
    );
  }
}
//export PATH=/Users/lubangqiang/development/flutter/bin:$PATH