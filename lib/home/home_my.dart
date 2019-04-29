import 'package:flutter/material.dart';


class HomeMy extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud,size: 64.0,color: Colors.teal),),
      Center(child: Icon(Icons.alarm,size: 64.0,color: Colors.cyan),),
      Center(child: Icon(Icons.forum,size: 64.0,color: Colors.blue),)
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.cloud),text: 'tab1',),
      Tab(icon: Icon(Icons.alarm),text: 'tab2',),
      Tab(icon: Icon(Icons.forum),text: 'tab3',)
    ];
    return DefaultTabController(
        length: _kTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('我的tab'),
            backgroundColor: Colors.cyan,
            bottom:TabBar(
              tabs: _kTabs,
            )
          ),
          body: TabBarView(
            children: _kTabPages,
          ),
        ),
    );
  }
}