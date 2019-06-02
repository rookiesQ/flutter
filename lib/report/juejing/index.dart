import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hk_app/report/juejing/listContent/backEnd.dart';

class ListViews extends StatefulWidget{
  final data;
  ListViews({this.data}):super();
  @override
  ListState createState() => ListState();
  
}
class ListState extends State<ListViews> with SingleTickerProviderStateMixin{
  dynamic currentIndex = 1;
  List tabContent = <Widget>[];
  List tabs = <Tab>[];
  
  @override
  
  void initState(){
    print(widget.data);
     widget.data.forEach((li){
        tabContent.add(
          listContent(li),
        );
        tabs.add(new Tab(
          text: li.name,
        ));
    });
     super.initState();
  }
  @override
  Widget build(BuildContext context){
    return 
        IndexedStack(
          index: 0,
          children: <Widget>[
            DefaultTabController(
              length: tabs.length,
              child: Scaffold(
                appBar: AppBar(
                  title: TabBar(
                    tabs: tabs,
                    indicatorSize:TabBarIndicatorSize.label,
                    isScrollable: true,
                  ),
                  
                ),
                body: new TabBarView(
                  children: tabContent,
                )
              ),
            ),
            
          ],
        );
  }
}
// first Page 
 

// 构建未获取数据渲染界面
class StateNone extends StatefulWidget {
  @override
  _StateNoneState createState() => _StateNoneState();
}

class _StateNoneState extends State<StateNone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('掘金'),
      ),
      body: Center(child: Text('加载中'),),
    );
  }
}



