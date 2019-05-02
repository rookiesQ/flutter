import 'package:flutter/material.dart';
import 'package:hk_app/common/tabOne.dart';
import 'package:hk_app/common/tabTwo.dart';
import 'package:hk_app/common/tabThree.dart';
class HomeMy extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    final _kTabPages = <Widget>[
      TabOne(),
      TabTwo(),
      TabThree()
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.work),text: 'word',),
      Tab(icon: Icon(Icons.alarm),text: '闹钟',),
      Tab(icon: Icon(Icons.forum),text: '书籍',)
    ];
    //var screenSize;
        return DefaultTabController(
            length: _kTabs.length,
            child: Scaffold(
              appBar: PreferredSize(
                child :Container(
                  padding: EdgeInsets.only(top:20),
                  decoration: BoxDecoration(
                    color: Colors.cyan
                  ),
                  child:TabBar(
                      tabs: _kTabs,
                    )
                  ),  
                preferredSize: Size.fromHeight(70),
          ),
         
          body: TabBarView(
            children: _kTabPages,
          ),
        ),
    );
  }
}