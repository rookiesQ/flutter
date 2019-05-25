import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ItHome extends StatefulWidget{
  @override
  ItHomeState createState() => ItHomeState();
  
}
class ItHomeState extends State<ItHome>{
  dynamic currentIndex = 1;
  ScrollController _controller = new ScrollController();
  List tabContent = <Widget>[];
  List tabs = <Tab>[
  ];
  dynamic listD =[];
  
  @override
  void initState(){
     super.initState();
     listData().then((res){
       setState(() {
         listD =res['Result'];
       });
     });
     _controller.addListener((){
       print(this._controller.position.pixels);
       if (_controller.position.pixels >= _controller.position.minScrollExtent){
         currentIndex ++;
         listData().then((res){
           print(res);
         });
       }
     });
  }
  // 获取更多的数据
  listMore () {

  }
  // 获取的数据
  Future listData() async{
    final response = await http.get(
      'https://m.ithome.com/api/news/newslistpageget?Tag=&ot=1558429933000&page=${this.currentIndex}');
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
                      child: Text(listD[position]['title']),
                    ),
                  );
            return  Container(
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
        },
      )
    );
  }
}
