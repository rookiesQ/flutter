import 'package:flutter/material.dart';
import "package:hk_app/common/head.dart";
class HomeArrive extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("到货通知",style: TextStyle(color: Colors.black),),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          new HeaderPart(),
          Expanded(
            flex: 1,
            child: new Menu(),
          )
        ]
      )
    );
  }
}

// 可滑动菜单栏
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
  Widget build(BuildContext context){
    return GridView.count(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      crossAxisCount: 3,
      mainAxisSpacing: 0,//竖向间距
      crossAxisSpacing: 0,//横向间距
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6ba,fontFamily:'AppIconBase'),size:28,color:Color.fromRGBO(228, 122, 105, 1)),
              SizedBox(height:20),
              Text("品牌到货通知",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6b9,fontFamily:'AppIconBase'),size:28,color:Color.fromRGBO(228, 122, 105, 1)),
              SizedBox(height:20),
              Text("周品牌到货计划",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        
        
       
      ]
    );
  }
}