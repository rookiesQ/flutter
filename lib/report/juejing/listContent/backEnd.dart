
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:hk_app/util/http.dart';
class listContent extends StatefulWidget {
  final list;
  listContent(this.list):super();
  @override
  _listContentState createState() => _listContentState();
}

class _listContentState extends State<listContent> {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArticle(category:widget.list.id),
      builder: (context ,AsyncSnapshot snapshot){
         switch (snapshot.connectionState) {
          case ConnectionState.none: 
          return StateNone();
          break;
          case ConnectionState.waiting: 
          return StateNone();
          break;
          case ConnectionState.done: 
              Map<String, dynamic> json = jsonDecode(snapshot.data);
              //var data = Autogenerated.fromJson(json);
              if (json['m']=='ok'){
                return ListContent(list: json['d']);
              } else{
                return StateNone();
              }
            break;
          
          case ConnectionState.active:
            return StateNone();
            break;
        }
        return null;
        
      },
    );
  }
}

// 构建未获取数据渲染界面
class StateNone extends StatefulWidget {
  @override
  _StateNoneState createState() => _StateNoneState();
}

class _StateNoneState extends State<StateNone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('加载中'),),
    );
  }
}


// 加载列表数据
class ListContent extends StatefulWidget {
  final list;
  @override
  ListContent({this.list}):super();
  _ListContentState createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    var listTiles= <Widget>[];
    //print(widget.list['entrylist'][0].toString());
    widget.list['entrylist'].forEach((li){
        var tagsTitle = '';
        for(var i=0;i<li['tags'].length;i++){
          if(tagsTitle !=''){
              tagsTitle +='/'+li['tags'][i]['title'];
          } else{
              tagsTitle +=li['tags'][i]['title'];
          }
        }
        listTiles.add(
          Column(
            children: <Widget>[
              li['user']['avatarLarge']!= null ? Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(children: <Widget>[
                       Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                          child: ClipOval(
                            child:Image.network(
                              li['user']['avatarLarge'],
                              width: 20,
                              height:20,
                              fit:BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: 
                           Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 5, 0),
                            child: Text(
                              li['user']['username'],
                              overflow:TextOverflow.ellipsis,
                              maxLines:1
                            )
                          ),
                        )
                       
                    ],),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child:  
                          Text(
                              tagsTitle, //==null ? li['tags'][0]['title']:li['tags'][1]['title']+'/'+li['tags'][0]['title'],
                              overflow:TextOverflow.ellipsis,
                              maxLines:1,
                              style: TextStyle(),
                            ),
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0)
                    ),
                  )
                 
              ],) : Text(''),
              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                alignment: Alignment.topLeft,
                child:Text(li['title'],style: TextStyle(fontSize: 18),)
              ),
               Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                child:Text(
                  li['content'],
                  style: TextStyle(fontSize: 14,color: Colors.grey),
                  textAlign: TextAlign.justify,
                  overflow:TextOverflow.ellipsis,
                  maxLines:3
                )
              )
            ]
          )
          
        );
      
      
      listTiles.add(
          Divider()
      );
    });
    return ListView(children: listTiles);
  }
}