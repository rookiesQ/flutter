import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final title;
  final url;

  WebViewPage({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  bool isLoad = true;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  var presentUrl = '';
  @override
  void initState() {
    flutterWebviewPlugin.onUrlChanged.listen((state){
      
      setState(() {
        presentUrl = state;
      });
      print(presentUrl);
    });
    flutterWebviewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      }
    });
    super.initState();
  }

//  Future<bool> _requestPop() {
//    //相当于Android的setResult
//    Navigator.pop(context, "返回给上一个页面的测试数据");
//    return new Future.value(false);
//  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        print(flutterWebviewPlugin.close());
        //Navigator.of(context).pop(100);///弹出页面并传回int值100，用于上一个界面的回调
        return new Future.value(false);
      },
      child: WebviewScaffold(
        url: widget.url,
        appBar: new AppBar(
          elevation: 0.4,
          title: new Text(widget.title),
          actions: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:Text('返回')
              ),
              onTap: (){
                flutterWebviewPlugin.goBack();
              },
            )
          ],
          bottom: new PreferredSize(
            child: isLoad
                ? new LinearProgressIndicator()
                : new Divider(height: 1.0, color: Colors.blue),
            preferredSize: const Size.fromHeight(1.0),
          ),
        ),
        withJavascript: true,
        withZoom: false,
        withLocalStorage: true,
      ),
    );
  }

  of() {}
}
