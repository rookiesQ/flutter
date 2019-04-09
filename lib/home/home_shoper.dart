import 'package:flutter/material.dart';
import "package:hk_app/common/head.dart";
class HomeShoper extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("专属店员",style: TextStyle(color: Colors.black),),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: Flex(
        direction: Axis.vertical,
        children:<Widget>[
          new HeaderPart(),
          Expanded(
            flex:1,
            child: new Menu()
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
              Icon(IconData(0xe6c9,fontFamily:'AppIconBase'),size:28,color:Color(0XFF29bef5)),
              SizedBox(height:20),
              Text("会员销售情况",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6c8,fontFamily:'AppIconBase'),size:28,color:Color(0XFFf45e4a)),
              SizedBox(height:20),
              Text("会员等级分布",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6cd,fontFamily:'AppIconBase'),size:28,color:Color(0xFF1c87ff)),
              SizedBox(height:20),
              Text("专属店员",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6cc,fontFamily:'AppIconBase'),size:28,color:Color(0xfff8507b)),
              SizedBox(height:20),
              Text("会员自定义标签",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6cb,fontFamily:'AppIconBase'),size:28,color:Color(0xff1c87ff)),
              SizedBox(height:20),
              Text("线上销售",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6ca,fontFamily:'AppIconBase'),size:28,color:Color(0xfff8507b)),
              SizedBox(height:20),
              Text("顾客到店提醒",style:TextStyle(fontSize: 13,color:Colors.black))
            ]
          )
        ),
      ]
    );
  }
}