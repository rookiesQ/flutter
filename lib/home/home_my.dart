import 'package:flutter/material.dart';
import 'package:hk_app/login/login.dart';
class HomeMy extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            height: 180,
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/common/my_portrait.png"),
                  width: 60,
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                  "彭晓飞",
                  style: TextStyle(
                    fontSize:20,
                    color: Colors.white
                  ),
                ) 
              )
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/common/bsbg.png"),
                fit: BoxFit.fill
              )

            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: new Border(
                      bottom: BorderSide(
                        color: Color(0xFFf2f2f2)
                      )
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                       Icon(IconData(57345, fontFamily: 'MaterialIcons'),size:28,color:Color(0xFF03a9f4)),
                       Container(
                         margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                         child: Text("版本号",style: TextStyle(fontSize: 18),),
                       ),
                       Expanded(
                         child:  Container(
                           alignment: Alignment.bottomRight,
                           child: Icon(
                              IconData(58828, fontFamily: 'MaterialIcons',),size:36,color:Color(0xFFdddddd)
                           ),
                         )
                       )
                    ],
                  ),
                ),
                Container(
                  padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: new Border(
                      bottom: BorderSide(
                        color: Color(0xFFf2f2f2)
                      )
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                       Icon(IconData(59568, fontFamily: 'MaterialIcons'),size:28,color:Color.fromRGBO(245, 195, 68, 1)),
                       Container(
                         margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                         child: Text("员工保密制度",style: TextStyle(fontSize: 18),),
                       ),
                       Expanded(
                         child:  Container(
                           alignment: Alignment.bottomRight,
                           child: Icon(
                              IconData(58828, fontFamily: 'MaterialIcons',),size:36,color:Color(0xFFdddddd)
                           ),
                         )
                       )
                    ],
                  ),
                ),Container(
                  padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: new Border(
                      bottom: BorderSide(
                        color: Color(0xFFf2f2f2)
                      )
                    )
                  ),
                  child: Row(
                    children: <Widget>[
                       Icon(IconData(58154, fontFamily: 'MaterialIcons'),size:28,color:Color.fromRGBO(65, 133, 246, 1)),
                       Container(
                         margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                         child: Text("修改密码",style: TextStyle(fontSize: 18),),
                       ),
                       Expanded(
                         child:  Container(
                           alignment: Alignment.bottomRight,
                           child: Icon(
                              IconData(58828, fontFamily: 'MaterialIcons',),size:36,color:Color(0xFFdddddd)
                           ),
                         )
                       )
                    ],
                  ),
                ),Container(
                  padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    border: new Border(
                      bottom: BorderSide(
                        color: Color(0xFFf2f2f2)
                      )
                    )
                  ),
                  child: new GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Icon(IconData(59564, fontFamily: 'MaterialIcons'),size:28,color:Colors.red[900]),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text("注销",style: TextStyle(fontSize: 18,),),
                        ),
                        Expanded(
                          child:  Container(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                                IconData(58828, fontFamily: 'MaterialIcons',),size:36,color:Color(0xFFdddddd)
                            ),
                          )
                        )
                      ],
                    ),
                    onTap: (){
                       print("121");
                       Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                          return new LoginView();
                       }));
                    },
                  )
                  
                )
              ],
            ),
          )
        ],
      )
    );
  }
}