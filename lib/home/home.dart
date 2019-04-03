import 'package:flutter/material.dart';
import '../common/common_footer.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return new MaterialApp(
          title: 'Welcom to Flutter1',
          theme: new ThemeData(
            primaryColor: Colors.blue
          ),
          home: BottomNavigationWidget()
    );
  }
}
//export PATH=/Users/lubangqiang/development/flutter/bin:$PATH