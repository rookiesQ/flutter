
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
dynamic  _context1 = BuildContext;
class LoadingPage {
  final BuildContext _context;
  bool loadingStatu = false;
  LoadingPage(this._context);
 
  ///打开loading
  void show() {
      loadingStatu = true;

     showCupertinoDialog(
        context: _context,
        builder: (context) {
          return LoadingDailog();
        },
      );
  }
 
  ///关闭loading
  void close() {
    print(_context);
     //Navigator.of(_context).pop();
     Future.delayed(
          Duration(milliseconds: 200 ),
          () {
             popLoading();
          },
        );
   
  }
}
void popLoading(){
     Navigator.of(_context1).pop();
  }
class LoadingDailog extends StatefulWidget {
  @override
  _LoadingDailogState createState() => _LoadingDailogState();
}

class _LoadingDailogState extends State<LoadingDailog> {
  
  @override
  
  Widget build(BuildContext context) {
    _context1 = context;
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)));
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: false,
        removeTop: false,
        removeRight: false,
        removeBottom: false,
        context: context,
        child: Center(
          child: SizedBox(
            width: 125,
            height: 125,
            
            child: Material(
              elevation: 24.0,
              color: Colors.black87,
              type: MaterialType.card,
              //在这里修改成我们想要显示的widget就行了，外部的属性跟其他Dialog保持一致
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Text("加载中",style: TextStyle(color: Colors.white),),
                  ),
                  /*ButtonBar(children: <Widget>[
                    GestureDetector(
                      onTap: popLoading,
                      child:Text('返回',style:TextStyle(color:Colors.white))
                      )
                  ],)*/
                ],
              ),
              shape: _defaultDialogShape,
            ),
          ),
        ),
      ),
    );
  }
}

 