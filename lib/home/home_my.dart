
import 'package:flutter/material.dart';
import 'package:hk_app/login/login.dart';
import 'dart:convert';
import 'package:hk_app/util/http.dart' as http;
 // 获取设备信息
import 'package:package_info/package_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hk_app/data/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;
import '../common/loading.dart';
class HomeMy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeContent()
      )
    );
  }
}
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  dynamic userInfoData;
  String systemType = '';
  String userName = "";
  @override
  void initState(){
    super.initState();
    getUserInfo();
  }
  void getUserInfo() {
        if (Platform.isIOS){
          systemType = 'ios';
        }
        if (Platform.isAndroid){
          systemType = 'android';
        }
        SharedPreferences.getInstance()
        ..then((prefs) {
          Map<String, dynamic> userinfo = json.decode(prefs.getString("userInfo"));
          if(userinfo !=null){
            userInfoData = Autogenerated.fromJson(userinfo); 
            setState(() {
               userName =Autogenerated.fromJson(userinfo).data.personnelName;
            });
          }
        });
    }
  Widget build(BuildContext context) {
    return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/common/bsbg.png"),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Container(
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
                              userName,
                              style: TextStyle(
                                fontSize:20,
                                color: Colors.white
                              ),
                            ) 
                          )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding:EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(
                              color: Color(0xFFf2f2f2)
                            )
                          )
                        ),
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Icon(IconData(57345, fontFamily: 'MaterialIcons'),size:28,color:Color(0xFF03a9f4)),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text("版本号",style: TextStyle(fontSize: 14),),
                              ),
                              Expanded(
                                child:  Container(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                      IconData(58828, fontFamily: 'MaterialIcons',),size:26,color:Color(0xFFdddddd)
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap:() {
                        PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
                              Fluttertoast.showToast(
                                msg: packageInfo.version,
                                 gravity: ToastGravity.CENTER
                              );
                              print(packageInfo);
                            });
                      }
                    ),
                InkWell(
                  onTap: () {
                    print(RouteObserver());
                     // Navigator.of(context).pushNamed("intimate");
                  },
                  child: Container(
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
                          child: Text("隐私协议",style: TextStyle(fontSize: 14),),
                        ),
                        Expanded(
                          child:  Container(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                                IconData(58828, fontFamily: 'MaterialIcons',),size:26,color:Color(0xFFdddddd)
                            ),
                          )
                        )
                      ],
                    )
                    
                  )
                ),
                /*Container(
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
                         child: Text("修改密码",style: TextStyle(fontSize: 14),),
                       ),
                       Expanded(
                         child:  Container(
                           alignment: Alignment.bottomRight,
                           child: Icon(
                              IconData(58828, fontFamily: 'MaterialIcons',),size:26,color:Color(0xFFdddddd)
                           ),
                         )
                       )
                    ],
                  ), 
                ),*/InkWell(
                  child: Container(
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
                        Icon(IconData(59564, fontFamily: 'MaterialIcons'),size:28,color:Colors.red[900]),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text("注销",style: TextStyle(fontSize: 14),),
                        ),
                        Expanded(
                          child:  Container(
                            alignment: Alignment.bottomRight,
                            
                            child: Icon(
                                IconData(58828, fontFamily: 'MaterialIcons'),size:26,color:Color(0xFFdddddd),
                               
                            ),
                          )
                        )
                      ],
                    )
                  ),
                  onTap: (){
                       LoadingPage loadingPage = LoadingPage(context);
                       loadingPage.show();
                       var bodyParam = {
                          "CompanyID" : userInfoData.data.companyID,
                          "PersonnelID" : userInfoData.data.personnelID,
                          "Token" :userInfoData.data.memberToken,
                          "Client_Type" :systemType,
                          "UserID" : userInfoData.data.userID ,
                          "SystemCall" :  false
                        };
                        //loadingPage.close();
                        print(bodyParam);
                        /*http.ajaxRequest(bodyParam, "/user/Logout").then((res){
                         
                          /*if (res.code == 200 ){
                            Fluttertoast.showToast(
                                msg: '注销成功',
                                 gravity: ToastGravity.CENTER
                            );
                            new Future.delayed(const Duration(milliseconds: 1000)).then((res) {
                                  // Navigator.of(context).canPop();
                                   
                                   // new MaterialPageRoute(
                                       // builder: (context) => new LoginView());
                                    
                                   // (route) => route == null);
                              });
                           
                          }*/
                          
                        });*/
                        

                  },
                )
                  ]
                );
  }
}