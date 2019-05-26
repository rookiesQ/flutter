import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hk_app/home/home.dart';

import 'dart:io' show Platform;

import '../common/loading.dart';
// 添加网络请求
import 'package:hk_app/util/http.dart';
// 登录界面
class LoginView extends StatefulWidget {
  _LoginView createState() => _LoginView();
}
class _LoginView extends State<LoginView> {
  TextEditingController _phonecontroller=TextEditingController();
  TextEditingController _pwdcontroller = TextEditingController();
  bool deletePhone= false;
  bool deletePwd= false;
  String systemType = '';
  // 错误信息
  @ override
  void initState() {
    super.initState();
    if (Platform.isIOS){
      systemType = 'ios';
    }
    if (Platform.isAndroid){
      systemType = 'android';
    }
  }
  bool errorStatu = false;
  String errorData = '';
  
  loginPage () {
   
    LoadingPage loadingPage = LoadingPage(context);
    if (_pwdcontroller.text.length>0 && _phonecontroller.text.length >0){
        loadingPage.show();
        var dataParam = {
          'AppID' : 'hkmobile',
			    'UDID' : _phonecontroller.text
        };
        authorizRequest(dataParam).then((res) {
          var data= res;
          if (data == null) {
            Fluttertoast.showToast(
                msg: data.toString(),
                fontSize: 14,
                gravity: ToastGravity.CENTER
            );
            return;
          }
          if (data.status.code != 0){
            setState(() {
             errorData = data.status.message; 
             errorStatu = true;
            });
            loadingPage.close();
            return;
          }
          if (data.data.allowLogin == 0){
            setState(() {
             errorData = data.data.msg; 
             errorStatu = true;
            });
            loadingPage.close();
            return;
          }
          var usercode = data.data.userCode;
          // 清除提醒
          var param = {
            'username': usercode,
			      'password': _pwdcontroller.text,
			      'systemType': systemType,
			      'PhoneNumber': _phonecontroller.text
          };
          loadingPage.close();
          ajaxRequest(param , '/user/Login').then((res1) {
            if(res1.code == 1){
              setState(() {
                errorData = ''; 
                errorStatu = false;
              });
              Fluttertoast.showToast(
                msg: '登录成功',
                fontSize: 14,
                gravity: ToastGravity.CENTER
              );
              new Future.delayed(const Duration(milliseconds: 1000)).then((res2){
                Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                      builder: (context) => HomeApp()
                  ),
                  (route) => route == null
                );
              });
              
            } else {
               setState(() {
                errorData = res1.message; 
                errorStatu = true;
              });
            }
            
            
          });
         
          
        });
       
    } else {
        if (_phonecontroller.text.length == 0){
          Fluttertoast.showToast(
              msg: "请填写用户名",
              fontSize: 14,
              gravity: ToastGravity.CENTER
          );
          return;
        }
        if (_pwdcontroller.text.length == 0){
          Fluttertoast.showToast(
              msg: "请填写密码",
              fontSize: 14,
              gravity: ToastGravity.CENTER
          );
          return;
        }
       
    }
  }
  @override
  Widget build(BuildContext context) {
    _phonecontroller.addListener((){
      var state = false;
      if (_phonecontroller.text.length >0) {
          state= true;
      } else {
         state= false;
      }
      setState(() {
         deletePhone = state;
      });
    });
    _pwdcontroller.addListener((){
      bool state = false;
      if (_pwdcontroller.text.length >0) {
        state= true;
      } else {
        state = false; 
      }
      setState(() {
         deletePwd = state;
      });
    });
    return Scaffold(
      body:new Container(
          decoration:BoxDecoration(
            image: new DecorationImage(
              image:AssetImage('assets/images/bg.png'),
              fit:BoxFit.cover
            )
          ),
          child: Center(
            child:new SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25,70,20,10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Hello!",
                      textAlign: TextAlign.left,
                      style:TextStyle(
                        fontSize: 45,
                        color: Color.fromRGBO(58, 115, 207,1),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      )
                    )
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Welcome',
                      textAlign: TextAlign.left,
                      style:TextStyle(
                          fontSize: 40,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          color: Color.fromRGBO(58, 115, 207,1)
                      )
                    )
                  ],
                ),
                SizedBox(height: 80),
                //输入用户名
                Theme(
                  data: new ThemeData(primaryColor: Color.fromRGBO(132,126,128, 1), hintColor: Color.fromRGBO(132,126,128, 1)),
                  child: new Container(
                    padding:EdgeInsets.fromLTRB(0, 2, 3, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child:Column(
                      children: <Widget>[
                        TextField(
                          maxLines: 1,
                          controller: _phonecontroller,
                          scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 170),
                          style:TextStyle(
                            color: Colors.white
                          ),
                          decoration: InputDecoration(
                            hintText: '请输入用户名',
                            border: InputBorder.none,
                            hintStyle: new TextStyle(
                              color: Color.fromRGBO(183 ,182, 180, 1),
                            ),
                            suffixIcon: deletePhone ? new IconButton(
                                icon: new Icon(Icons.clear,
                                color: Color.fromRGBO(183 ,182, 180, 0.5)),
                                iconSize: 20,
                                onPressed: () {
                                  _phonecontroller.text = "";
                                },
                            ): Text("")
                          ),
                        ),
                        Divider(color:Color.fromRGBO(183 ,182, 180, 0.8))
                      ],
                    )
                  )
                ),
                //
                //输入密码
                Theme(
                  data: new ThemeData(primaryColor: Color.fromRGBO(132,126,128, 1), hintColor: Color.fromRGBO(132,126,128, 1)),
                  child: new Container(
                    padding:EdgeInsets.fromLTRB(0, 2, 0, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:Column(
                      children: <Widget>[
                        TextField(
                          maxLines: 1,
                          obscureText: true,
                          scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 120),
                          controller: _pwdcontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: '请输入密码',
                            border: InputBorder.none,
                            hintStyle: new TextStyle(
                              color: Color.fromRGBO(183 ,182, 180, 1)
                            ),
                            suffixIcon: deletePwd ? new IconButton(
                                iconSize: 20,
                                icon: new Icon(
                                  Icons.clear,
                                  color: Color.fromRGBO(183 ,182, 180, 0.5),
                                ),
                                onPressed: () {
                                  _pwdcontroller.text = "";
                                },
                            ): Text("")
                          ),
                        ),
                        Divider(color:Color.fromRGBO(183 ,182, 180, 0.8))
                      ],
                    )
                  )
                ),
                Row(
                  children: <Widget>[
                     errorStatu ? Text(errorData,style: TextStyle(color:Colors.red),textAlign: TextAlign.left,): Text("")
                  ],
                ),
               
                SizedBox(height:40),
                // 登录按钮
                new SizedBox(
                  child: new GestureDetector(
                    onTap: (){
                      loginPage();
                    },
                    child: new Container(
                    padding:EdgeInsets.fromLTRB(2, 10, 2, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(83, 84, 89, 1)
                    ),
                    alignment: Alignment.center,
                    child:Text(
                      '登录',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        color: Color.fromRGBO(186, 187, 191, 1)
                      )
                    )
                  )
                  )
                ),
                SizedBox(height: 120),
                Text(
                    "恒康科技Copyright©2019",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(255, 255, 255, 0.5)
                    )
                  ),
              ],
            ),
          )
        )
      ),
      
    );
  }
}




