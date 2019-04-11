import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashScreenState() ;
  }

}

class SplashScreenState extends State<SplashScreen> {

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "",
        description:
        "",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        //marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        backgroundImage: 'assets/launch_image.png',
        backgroundOpacity: 0,
        //directionColorBegin: Alignment.topLeft,
        //directionColorEnd: Alignment.bottomRight,
      ),
    );

    slides.add(
      new Slide(
        title: "",
        description:
        " ",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        backgroundImage: 'assets/launch3.png',
        backgroundOpacity: 0,
        //directionColorBegin: Alignment.topLeft,
        //directionColorEnd: Alignment.bottomRight,
      ),
    );

    /*slides.add(
      new Slide(
        title: "Welcome",
        description:
        "赠人玫瑰，手有余香；\n分享技术，传递快乐。",
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Raleway'),
        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
      ),
    );*/
  }

  void onDonePress() {
    _setHasSkip();
    Navigator.of(context).pushNamedAndRemoveUntil('/login',(route)=> route == null);
  }

  void onSkipPress() {
    _setHasSkip();
    Navigator.of(context).pushNamedAndRemoveUntil('/login',(route)=> route == null);
  }

  void _setHasSkip ()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("hasSkip", true);
  }


  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        //onSkipPress: this.onSkipPress,
        nameSkipBtn: "",
        nameNextBtn: "",
        nameDoneBtn: "进入",
        colorDoneBtn: Color(0xff1c87ff),
        styleNameDoneBtn:TextStyle(
          color: Color(0xff000000),
        ),
        renderDoneBtn:Container(
          color:Color(0xffffffff)
        )
    );
  }

}