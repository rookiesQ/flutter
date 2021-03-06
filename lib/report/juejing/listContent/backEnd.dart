
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:hk_app/util/http.dart';
import 'package:hk_app/report/juejing/detail.dart';
class listContent extends StatefulWidget {
  dynamic list,_listData=[];
  listContent(this.list):super();
  @override
  _listContentState createState() => _listContentState();
}
class _listContentState extends State<listContent> with AutomaticKeepAliveClientMixin{
  Future<Null> _onRefresh() async{
    await Future.delayed(Duration(seconds:2),(){
      getArticle(category:widget.list.id,before: '').then((res){
        Map<String, dynamic> json = jsonDecode(res);
        if (json['m']=='ok'){
           widget._listData.clear();
          if (json['d']['total'] >0){
            setState(() {
              widget._listData=json['d']['entrylist'];
            });
            
          }
        }
      });
    });
  }
  initData() {
    getArticle(category:widget.list.id).then((res){
      Map<String, dynamic> json = jsonDecode(res);
              //var data = Autogenerated.fromJson(json);
              if (json['m']=='ok'){
                if (json['d']['total'] >0){
                  setState(() {
                    widget._listData =  json['d']['entrylist'];
                  });
                  
                }
              }
    });
  }
  @override
  void initState() {
    initData();
    // TODO: implement initState
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    if (widget._listData.length >0){
      return RefreshIndicator(
        child:ListContentMore(list: widget._listData,id:widget.list.id),
        onRefresh: _onRefresh,
      );
    } else {
      return EmptyData();
    }
  }
}

class ListContentMore extends StatefulWidget {
  final list;
  final id;
  ListContentMore({this.list,this.id}):super();
  @override
  _ListContentMoreState createState() => _ListContentMoreState();
}

class _ListContentMoreState extends State<ListContentMore> with AutomaticKeepAliveClientMixin{
 
  bool isPerformingRequest = false;
  ScrollController _scrollController = new ScrollController();
  void initState(){
    super.initState();
    _scrollController.addListener((){
      var lastPosition = widget.list[widget.list.length-1]['rankIndex'];
      if(_scrollController.position.pixels >=_scrollController.position.maxScrollExtent){
        listViewMore(lastPosition);
      }
    });
  }
   @override
  bool get wantKeepAlive => true;
  // 获取下一页的数据
  void listViewMore(last){
    if(!isPerformingRequest){
      setState(() {
        isPerformingRequest = true;
      });
      getArticle(category:widget.id,before: last).then((res){
        Map<String, dynamic> json = jsonDecode(res);
        if (json['m']=='ok'){
          if (json['d']['total'] >0){
            setState(() {
              widget.list.addAll(json['d']['entrylist']);
              isPerformingRequest = false;
            });
            
          }
        }
      });
    }
  }

  // 获取和处理下一页的数据
  Widget build(BuildContext context) {
     super.build(context);
    return ListView.builder(
      itemCount: widget.list.length,
      controller:  _scrollController,
      
      itemBuilder: (BuildContext context ,int position){
        if(position+1 == widget.list.length)
           return Center(
             child:new Opacity(
                opacity: isPerformingRequest ? 1.0 : 0.0,
                child: new CircularProgressIndicator(),
              ),
           );
        else {
          var tagsTitle = '';
          for(var i=0;i<widget.list[position]['tags'].length;i++){
            if(tagsTitle !=''){
                tagsTitle +='/'+widget.list[position]['tags'][i]['title'];
            } else{
                tagsTitle +=widget.list[position]['tags'][i]['title'];
            }
          }
          return  GestureDetector(
            child: Column(
                  children: <Widget>[
                    widget.list[position]['user']['avatarLarge']!= null ? Flex(
                      direction: Axis.horizontal,
                    
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Row(children: <Widget>[
                            Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                child: ClipOval(
                                  child: widget.list[position]['user']['avatarLarge']!= null ? 
                                    Image.network(
                                      widget.list[position]['user']['avatarLarge'],
                                      width: 20,
                                      height:20,
                                      fit:BoxFit.fill,
                                    )
                                    : 
                                    Image(
                                      image: AssetImage("assets/images/common/my_portrait.png"),
                                      width: 20,
                                      height: 20,
                                      fit:BoxFit.fill,
                                    ),
                                ),
                              ),
                              Expanded(
                                child: 
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 5, 0),
                                  child: Text(
                                    widget.list[position]['user']['username'],
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
                                    tagsTitle,
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
                      child:Text(widget.list[position]['title'],style: TextStyle(fontSize: 18),)
                    ),
                    Container(
                    
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                      child:Text(
                        widget.list[position]['content'],
                        style: TextStyle(fontSize: 14,color: Colors.grey),
                        textAlign: TextAlign.justify,
                        overflow:TextOverflow.ellipsis,
                        maxLines:3,
                      )
                    ),
                    Divider()
                  ]
                ),
                onTap:(){
                  print(ModalRoute.of(context).isActive);
                  print(ModalRoute.of(context).isActive);
                  //ModalRoute.of(context).isActive
                  Navigator.push(context,MaterialPageRoute(builder:(BuildContext context){
                      
                      return Detail(list:widget.list[position]);
                  }));
                }
          );
        }
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
// 构建未获取数据渲染界面
class EmptyData extends StatefulWidget {
  @override
  _EmptyDataState createState() => _EmptyDataState();
}

class _EmptyDataState extends State<EmptyData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('暂无数据'),),
    );
  }
}

// 加载列表数据