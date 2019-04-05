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
      body: Column(
        children:<Widget>[
          new HeaderPart(),
          Expanded(
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
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3
      ),
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Icon(IconData(0xe6c5,fontFamily:'AppIconBase'),size:28,color:Color.fromRGBO(228, 122, 105, 1)),
              SizedBox(height:20),
              Text("营运分析",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        )
      ],
    );
  }
}