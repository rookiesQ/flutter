import 'package:flutter/material.dart';
class TabThree extends StatefulWidget {
  final String area = "北京区部";
  final String name = "苹果审核测试";
  @override
 createState() => new HeaderPartState();
}
class HeaderPartState extends State<TabThree> {
  String area;
  String name;
  @override
  void initState() {
    area = widget.area;
    name = widget.name;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/common/bsbg.png'),
              fit: BoxFit.cover
            )
          ),
          height: 150,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: new Column(
            children: <Widget>[
              Center(
                    child: Container(
                      child:Icon(IconData(0xe611,fontFamily:'AppIconFonts'),size:28,color:Color.fromRGBO(139, 185, 249, 1)),
                      width: 65,
                      height:65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border:new Border.all(width:5,color:Color.fromRGBO(170,210,238,1)),
                        color: Colors.white
                      ),
                    )
              ),
              SizedBox(height:5),
              Center(
              child: new Text(name,style:TextStyle(fontSize:16,color:Colors.white))
              ),
              Center(
                child: new Text(area,style:TextStyle(fontSize:12,color:Colors.white))
              )
            ],
          )
        )
      ]);
  }
  void someMethod() {
    print(widget.area);
    setState(() => area = 'new name');
  }
}


