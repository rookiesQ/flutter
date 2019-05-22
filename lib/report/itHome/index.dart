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
  }
  Future listData() async{
    //
    final response = await http.get(
      'https://m.ithome.com/api/news/newslistpageget?Tag=&ot=1558429933000&page=0');
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
        itemBuilder: (BuildContext context ,int position){
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
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0,0),
                      child: Text(listD[position]['title']),
                    ),
                  )
                  
                  
                ],
              )
            );
        },
      )
    );
  }
}
