
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 
class LoadingPage {
  final BuildContext _context;
 
  LoadingPage(this._context);
 
  ///打开loading
  void show({Function onClosed}) {
    showDialog(
      context: _context,
      builder: (context) {
        return Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SpinKitFadingCircle(
                  itemBuilder: (_, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),
                Text('加载中',style: TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.none),)
              ]
            ),
            width: 250,
            height: 250,
          )
          
        );
      },
    ).then((value) {
      onClosed(value);
    });
  }
 
  ///关闭loading
  void close() {
     Future.delayed(
      Duration(milliseconds: 200 ),
      () {
          Navigator.of(_context).pop();
      },
    );

  }
}