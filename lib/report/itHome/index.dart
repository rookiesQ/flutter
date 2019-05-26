import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ItHome extends StatefulWidget{
  @override
  ItHomeState createState() => ItHomeState();
  
}
class ItHomeState extends State<ItHome>{
  ScrollController _controller = new ScrollController();
  List tabContent = <Widget>[];
  List tabs = <Tab>[];
  List listD =[];
  bool isPerformingRequest = false;
  @override
  void initState(){
     super.initState();
     listData().then((res){
       setState(() {
         listD =res['Result'];
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
      });
      listData().then((res){
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
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('it之家')
      ),
      body: ListView.builder(
        itemCount: listD.length,
        controller: _controller,
        itemBuilder: (BuildContext context ,int position){
            var expanded = Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                      child: Column(
                        children: <Widget>[
                          Text(listD[position]['title']),
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
              return Container(
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
              );
            }
            
        },
      )
    );
  }
}
