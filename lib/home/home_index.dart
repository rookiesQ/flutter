import 'package:flutter/material.dart';
import 'package:hk_app/report/itHome/index.dart';
import 'package:hk_app/report/word/word.dart';
class HomeKpi extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          Expanded(
            child: new Menu(),
          )
        ]
      ),
      
    );
  }
}


// 可以滑动的菜单栏
class Menu extends StatefulWidget{
  @override
  createState() => new MenuState();
}
class MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 0,//竖向间距
      crossAxisSpacing: 0,//横向间距
      children: <Widget>[
          InkWell(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0,40,0,0),
              child:Column(
                children: <Widget>[
                  Icon(
                    Icons.forum,
                    size:30,
                    color:Colors.pink
                  ),
                  SizedBox(height:20),
                  Text("it之家",style:TextStyle(fontSize: 13,color:Colors.black))
                ],
              ),
            ),
            onTap: () {
            Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                    return ItHome();
                  })
              );
            },
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0,40,0,0),
              child:Column(
                children: <Widget>[
                  Icon(
                    Icons.wb_cloudy,
                    size:30,
                    color:Colors.greenAccent
                  ),
                  SizedBox(height:20),
                  Text("单词",style:TextStyle(fontSize: 13,color:Colors.black))
                ],
              ),
            ),
            onTap: () {
            Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                    return WordHome();
                  })
              );
            },
          ),
      ],
    );
  }
}


