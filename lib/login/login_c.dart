import 'package:flutter/material.dart';

// 登录界面
class LoginView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scrollbar(
        
        child: new Container(
          padding: const EdgeInsets.fromLTRB(25,0,20,10),
          decoration:BoxDecoration(
            image: new DecorationImage(
              image:AssetImage('assets/images/bg.png'),
              fit:BoxFit.cover
            )
          ),
          child: 
            Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Hello!",
                  textAlign: TextAlign.left,
                  style:TextStyle(
                    fontSize: 45,
                    color: Colors.blue,
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
                      fontSize: 45,
                      height: 1,
                      decoration: TextDecoration.none,
                      color: Colors.blue
                  )
                )
              ],
            ),
            SizedBox(height: 80),
            new InputEdtextNameWiget(),
            SizedBox(height: 0,),
            new InputEdtextPasswordWiget(),
            SizedBox(height:40,),
            new LoginButtonWiget()
          ],
        )
      )

    );
  }
}

// 输入用户名
class InputEdtextNameWiget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Theme(
      data: new ThemeData(primaryColor: Color.fromRGBO(132,126,128, 1), hintColor: Color.fromRGBO(132,126,128, 1)),
      child: new Container(
        padding:EdgeInsets.fromLTRB(0, 2, 3, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
       
        child:TextField(
          maxLines: 1,
          //scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 200),
          style:TextStyle(
            color: Colors.white
          ),
          decoration: InputDecoration(
            hintText: '请输入用户名',
            hintStyle: new TextStyle(
              color: Color.fromRGBO(183 ,182, 180, 1),
              
            ),
            suffixIcon: new IconButton(
                icon: new Icon(Icons.clear,
                color: Color.fromRGBO(183 ,182, 180, 0.5)),
                iconSize: 20,
                onPressed: () {
                  print("123");
                },
            ),
          ),
        )
      )
    );
  }
}

// 输入密码
class InputEdtextPasswordWiget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Theme(
      data: new ThemeData(primaryColor: Color.fromRGBO(132,126,128, 1), hintColor: Color.fromRGBO(132,126,128, 1)),
      child: new Container(
        padding:EdgeInsets.fromLTRB(0, 2, 0, 2),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
         
        ),
        
        child:TextField(
          maxLines: 1,
          obscureText: true,
          //scrollPadding: EdgeInsets.fromLTRB(0, 0, 0, 100),
          //controller: _phonecontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: '请输入密码',
            hintStyle: new TextStyle(
              color: Color.fromRGBO(183 ,182, 180, 1)
            ),
            suffixIcon: new IconButton(
                iconSize: 20,
                icon: new Icon(
                  Icons.clear,
                  color: Color.fromRGBO(183 ,182, 180, 0.5),
                  
                ),
                onPressed: () {
                  
                },
            ),
          ),
        )
      )
    );
  }
}

// 登录按钮
class LoginButtonWiget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new SizedBox(
      child: new GestureDetector(
        onTap: (){
          print("12123");
          Navigator.pushNamed(context, "home");
        },
        child: new Container(
        padding:EdgeInsets.fromLTRB(2, 10, 2, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromRGBO(83, 84, 89, 1)
        ),
        alignment: Alignment.center,
        child:Text(
          '登录',
          textAlign: TextAlign.center,
          style:TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            color: Color.fromRGBO(186, 187, 191, 1)
          )
        )
      )
      )
      
    );
  }
}