import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:hk_app/login/login.dart';
//加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {

  @override
  void initState(){
    super.initState();
    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 2),(){
      _getHasSkip();
    });
  }

  void _getHasSkip ()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSkip = prefs.getBool("hasSkip");
    if(hasSkip==null||!hasSkip){
      Navigator.of(context).pushReplacementNamed("splash");
    }else {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (context) => LoginView()),
              (route) => route == null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        decoration:BoxDecoration(
            image: new DecorationImage(
              image:AssetImage('assets/launch_image.png'),
              fit:BoxFit.cover
            )
          ),
      ),
    );
  }

}