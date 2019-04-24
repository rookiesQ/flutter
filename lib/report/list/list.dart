import 'package:flutter/material.dart';
class ListViews extends StatefulWidget{
  @override
  ListState createState() => ListState();
  
}
class ListState extends State<ListViews>{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滑动的列表",style: TextStyle(color: Colors.white),),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Container(child: ListContent())
    );
  }
}
class ListContent extends StatefulWidget {
  @override
  _ListContentState createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    var listTiles= <Widget>[
      
    ];
    for (var i=0;i<20;i++){
      listTiles.add(
          ListTile(
            leading: Icon(Icons.face),
            title: Text('这第一级标题'),
            subtitle: Text('这是第二级标题'),
          )
      );
      listTiles.add(
          Divider()
      );
    }
    return ListView(children: listTiles);
  }
}


