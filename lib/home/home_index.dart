import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
      padding: const EdgeInsets.fromLTRB(0,30,0,0),
      mainAxisSpacing: 0,//竖向间距
      crossAxisSpacing: 0,//横向间距
      children: <Widget>[
        Container(
          child:InkWell(
            child:Column(
              children: <Widget>[
                Icon(IconData(0xe6c5,fontFamily:'AppIconBase'),size:28,color:Color.fromRGBO(228, 122, 105, 1)),
                SizedBox(height:20),
                Text("flutter中文网",style:TextStyle(fontSize: 13,color:Colors.black))
              ],
            ),
            onTap: (){
               Navigator.of(context).pushNamed('/animate');
            },
          )
          
        ),
        InkWell(
          child:Column(
            children: <Widget>[
                    Icon(IconData(0xe6be,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(65, 133, 246, 1)),
                    SizedBox(height:20),
                    Text("列表",style:TextStyle(fontSize: 13,color:Colors.black))
            
            ]
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/list');
          }
        ),
         InkWell(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6c3,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(229, 93, 124, 1)),
              SizedBox(height:20),
              Text("typescript中文网",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/nav');
          },
        ),
       
        
        
        
      ],
    );
  }
}


