import 'package:flutter/material.dart';
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
          child:Container(
            padding: const EdgeInsets.fromLTRB(0,40,0,0),
            child:Column(
              children: <Widget>[
                Icon(
                  IconData(59530, fontFamily: 'MaterialIcons'),
                  color:Colors.purple,
                  size: 30,
                ),
                SizedBox(height:20),
                Text("flutter中文网",style:TextStyle(fontSize: 13,color:Colors.black))
              ],
            ),
          ),
          onTap: (){
            Navigator.of(context).pushNamed('/flutter');
          },
        ),
       
        InkWell(
          child:Container(
            padding: const EdgeInsets.fromLTRB(0,40,0,0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.bookmark,
                  size:30,
                  color:Color.fromRGBO(229, 93, 124, 1)
                ),
                SizedBox(height:20),
                Text("typescript中文网",style:TextStyle(fontSize: 13,color:Colors.black))
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/typescript');
          },
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0,40,0,0),
            child:Column(
              children: <Widget>[
                Icon(
                  Icons.book,
                  size:30,
                  color:Colors.blue
                ),
                SizedBox(height:20),
                Text("掘金专网",style:TextStyle(fontSize: 13,color:Colors.black))
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/juejing');
          },
          ),
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
            Navigator.of(context).pushNamed('/it');
          },
          ),
          
        
      ],
    );
  }
}


