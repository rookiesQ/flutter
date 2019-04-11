import 'package:flutter/material.dart';
import 'package:hk_app/home/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
// 登录界面
class LoginView extends StatefulWidget {
  _LoginView createState() => _LoginView();
}
class _LoginView extends State<LoginView> {
  final _phonecontroller=TextEditingController();
  final _pwdcontroller = TextEditingController();
  bool deletePhone= false;
  bool deletePwd= false;
  changePwd () {
    if (_pwdcontroller.text.length >0) {
      deletePwd= true;
    } else {
      deletePwd= false;
    }
  }
  changePhone () {
    if (_phonecontroller.text.length >0) {
      deletePhone= true;
    } else {
      deletePhone= false;
    }
  }
  loginPage () {
    if (_pwdcontroller.text.length>0 && _phonecontroller.text.length >0){
        print(_pwdcontroller.text);
        print(_phonecontroller.text);
        Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                            builder: (context) => HomeApp()
                        ),
                        (route) => route == null);
    } else {
        if (_phonecontroller.text.length == 0){
          Fluttertoast.showToast(
              msg: "请填写用户名"
          );
          return;
        }
        if (_pwdcontroller.text.length == 0){
          Fluttertoast.showToast(
              msg: "请填写密码"
          );
          return;
        }
       
    }
  }
  @override
  Widget build(BuildContext context) {
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
                    Text('欢迎回来',
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
                    child:TextField(
                      maxLines: 1,
                      controller: _phonecontroller,
                      onChanged: changePhone(),
                      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 170),
                      style:TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        hintText: '请输入用户名',
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
                    child:TextField(
                      maxLines: 1,
                      obscureText: true,
                      onChanged:  changePwd(),
                      scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 120),
                      controller: _pwdcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '请输入密码',
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
                    )
                  )
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




