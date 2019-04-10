import 'package:flutter/material.dart';
import "package:hk_app/common/head.dart";
class HomeKpi extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("店铺KPI",style: TextStyle(color: Colors.black),),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("识花"),
              trailing: new Icon(Icons.local_florist),
               onTap: (){
                Navigator.of(context).pushNamed("/baidu");
              },
            ),
            new ListTile(
              title: new Text("营销之星"),
              trailing: new Icon(Icons.search),
              onTap: (){
                Navigator.of(context).pushNamed("/webview");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("设置"),
              trailing: new Icon(Icons.settings),
               onTap: (){
                Navigator.of(context).pushNamed("/test");
              },
            ),
          ],
        )
      ),
      body: new Column(
        children: <Widget>[
          HeaderPart(),
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
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6c5,fontFamily:'AppIconBase'),size:28,color:Color.fromRGBO(228, 122, 105, 1)),
              SizedBox(height:20),
              Text("营运分析",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        ),
        Container(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6be,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(65, 133, 246, 1)),
              SizedBox(height:20),
              Text("业绩KPI指标",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        ),
        Container(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6c3,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(229, 93, 124, 1)),
              SizedBox(height:20),
              Text("业绩达成率",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        ),
        Container(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6bf,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(230, 133, 116, 1)),
              SizedBox(height:20),
              Text("商品分析",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        ),
        Container(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6bd,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(94, 156, 247, 1)),
              SizedBox(height:20),
              Text("促销活动查询",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        ),
        Container(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6bb,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(134, 208, 244, 1)),
              SizedBox(height:20),
              Text("畅销滞销",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        ),
        Container(
          child:Column(
            children: <Widget>[
              Icon(IconData(0xe6c1,fontFamily:'AppIconBase'),size:26,color:Color.fromRGBO(65, 133, 246, 1)),
              SizedBox(height:20),
              Text("库存查询",style:TextStyle(fontSize: 13,color:Colors.black))
            ],
          )
        )
      ],
    );
  }
}


