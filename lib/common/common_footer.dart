import 'package:flutter/material.dart';
import '../home/home_kpi.dart';
import '../home/home_shoper.dart';
import '../home/home_intelligent.dart';
import '../home/home_my.dart';
import '../home/home_arrive.dart';

class BottomNavigationWidget extends StatefulWidget{
  @override
  _BottomNavigationWidgetState createState() => new _BottomNavigationWidgetState();
}
class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  final List<Widget> list = List();
  int _currentIndex = 0;
  @override
  void initState() {
    list 
      ..add(HomeKpi())
      ..add(HomeShoper())
      ..add(HomeArrive())
      ..add(HomeIntelligent())
      ..add( HomeMy());
      super.initState();

  }
  @override 
  Widget build(BuildContext content){
    return Scaffold(
      body:list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            
          });
        },
        type:BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe6ce,fontFamily:'AppIconBase'),size:20),
          
            title:Text('店铺KPI',style: TextStyle(fontSize: 14.0))
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe6d0,fontFamily:'AppIconBase'),size:20),
           
            title:Text('专属店员',style: TextStyle(fontSize: 14.0))
          ),BottomNavigationBarItem(
            icon: Icon(IconData(0xe6d2,fontFamily:'AppIconBase'),size:20),
          
            title:Text('到货通知',style: TextStyle(fontSize: 14.0))
          ),BottomNavigationBarItem(
            icon: Icon(IconData(0xe6d1,fontFamily:'AppIconBase'),size:20),
           
            title:Text('智能巡店',style: TextStyle(fontSize: 14.0))
          ),BottomNavigationBarItem(
            icon: Icon(IconData(0xe6cf,fontFamily:'AppIconBase')),
            title:Text('我的',style: TextStyle(fontSize: 14.0))
          )
        ]
      ),
    );
  }
}