import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
//加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState(){
    super.initState();
    SharedPreferences.getInstance()
     ..then((prefs) {
       bool hasSkip = prefs.getBool("hasSkip");
       if(hasSkip==null||!hasSkip){
          Navigator.of(context).pushReplacementNamed("splash");
        }else {
          Navigator.of(context).pushReplacementNamed("login");
        }
     });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child:Container(
        child: Image(
           image:AssetImage('assets/launch_image.png'),fit:BoxFit.cover
        )
      )
    );
  }

}