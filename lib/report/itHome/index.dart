import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hk_app/report/web/webView.dart';
class ItHome extends StatefulWidget{
  @override
  ItHomeState createState() => ItHomeState();
  
}
class ItHomeState extends State<ItHome>{
  ScrollController _controller = new ScrollController();
  List tabContent = <Widget>[];
  List tabs = <Tab>[];
  List listD =[];
  var  index = 0;
  bool isPerformingRequest = false;
  @override
  void initState(){
     super.initState();
     listData().then((res){
       setState(() {
         listD =res['Result'];
         //print(listD);
       });
     });
     _controller.addListener((){
       //print(this._controller.position.pixels);
       if (_controller.position.pixels >= _controller.position.maxScrollExtent){
         listMore ();
       }
     });
  }
  // 获取更多的数据
  listMore () {
    if(!isPerformingRequest){
      setState(() {
        isPerformingRequest = true;
          index ++ ;
      });
    
      print(index);
      var now = new DateTime.now();
      now = now.add(new Duration(minutes: -60*24*index));
      var tmp = now.millisecondsSinceEpoch;
      moreList(tmp).then((res){
          setState(() {
            listD.addAll(res['Result']);
            isPerformingRequest = false;
          });
      });
    }
    
  }
  // 获取的数据
  Future listData() async{
    var tmp = new DateTime.now().millisecondsSinceEpoch;
    final response = await http.get(
      'https://m.ithome.com/api/news/newslistpageget?Tag=&ot=${tmp}&page=0');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var decode = json.decode(response.body);
      return decode;
    }
  }
  Future<Null> _onRefresh() async{
    await Future.delayed(Duration(seconds:2),(){
       listData().then((res){
        setState(() {
          index = 0;
          listD =res['Result'];
          //print(listD);
        });
      });
    });
  }
  Future moreList(tmp) async{
    final response = await http.get(
      'https://m.ithome.com/api/news/newslistpageget?Tag=&ot=${tmp}&page=0');
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var decode = json.decode(response.body);
      return decode;
    }
  }
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('it之家')
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child:ListView.builder(
        itemCount: listD.length,
        controller: _controller,
        itemBuilder: (BuildContext context ,int position){
            var expanded = Expanded(
                    flex: 3,
                    
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                      child: Column(
                      
                        children: <Widget>[
                          Align(
                            child:  Text(listD[position]['title'],textAlign: TextAlign.start,style:TextStyle()),
                          ),
                          Padding(padding: EdgeInsets.all(9),),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Text(listD[position]['PostDateStr']),
                              ),
                              Expanded(
                                flex:1,
                                child: Text(listD[position]['commentcount'].toString()+'评论',style:TextStyle(),textAlign: TextAlign.right,),
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  );
            if (position+1 == listD.length){
              return Center(
                child:new Opacity(
                    opacity: isPerformingRequest ? 1.0 : 0.0,
                    child: new CircularProgressIndicator(),
                  ),
              );
            } else {
              return InkWell(
                child:Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
                  child: Row(
                  children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          listD[position]['image'],
                          width:100,
                          height:100
                        ),
                      ),
                      expanded
                    ],
                  )
                ),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context){
                      return WebViewPage(title: listD[position]['title'],url: listD[position]['WapNewsUrl']);
                    }
                  ));
                },
              );
            }  
        },
      )
      )
    );
  }
}
