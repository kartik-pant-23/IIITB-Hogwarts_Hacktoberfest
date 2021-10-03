import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iiitb_hogwarts/screens/home_page.dart';
import 'package:iiitb_hogwarts/widgets/background_image.dart';
import 'package:iiitb_hogwarts/widgets/group_badge.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _titleText1,
      _titleText2,
      _headerText,
      _icHat,
      _groupBadge;

  @override
  void initState() {
    _headerText =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _icHat =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _titleText1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _titleText2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _groupBadge =
        AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    Timer(Duration(milliseconds: 200), () {
      _icHat.forward();
    });
    Timer(Duration(milliseconds: 1500), () {
      _headerText.forward();
    });
    Timer(Duration(milliseconds: 3500), () {
      _titleText1.forward();
    });
    Timer(Duration(milliseconds: 5000), () {
      _titleText2.forward();
    });
    Timer(Duration(milliseconds: 7000), () {
      _groupBadge.forward();
    });
    Timer(Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleText1.dispose();
    _titleText2.dispose();
    _headerText.dispose();
    _icHat.dispose();
    _groupBadge.dispose();
    super.dispose();
  }

  Widget _pageHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: FadeTransition(
              opacity: _headerText,
              child: Text(
                'Hi there!\nWelcome to the wizarding world',
                style: TextStyle(fontFamily: "Harry Potter", fontSize: 24),
                textAlign: TextAlign.center,
              )),
        ),
        SizedBox(
          height: 120,
          width: 120,
          child: SlideTransition(
            position: Tween<Offset>(begin: Offset(-2, 0), end: Offset.zero)
                .animate(_icHat),
            child: SvgPicture.asset(
              'images/witch_hat.svg',
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _titleTextWidget1() {
    return FadeTransition(
      opacity: _titleText1,
      child: Text(
        'Your fate has been decided!',
        style: TextStyle(fontFamily: 'Harry Potter', fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _titleTextWidget2() {
    // TODO: For now statically nerdz is shown but decide this after user has registered (use state management)
    return FadeTransition(
      opacity: _titleText2,
      child: Text('Nerdz',
          style: TextStyle(fontFamily: 'Harry Potter', fontSize: 32),
          textAlign: TextAlign.center),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _pageHeader(),
                SizedBox(height: 10),
                _titleTextWidget1(),
                SizedBox(height: 80),
                _titleTextWidget2(),
                SizedBox(height: 20),
                // TODO: For now statically nerdz logo is being sent but decide this after user has registered (use state management)
                FadeTransition(
                    opacity: _groupBadge,
                    child: GroupBadge(
                        width: 200,
                        image:
                            "https://raw.githubusercontent.com/kartik-pant-23/IIITB-Hogwarts/master/assets/nerdz_logo.jpg"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToShowGroup() {
    // Timer(Duration(seconds: 1),() {
    //   //Navigator.of(context).pushReplacement(SlideLeftRoute(widget: ShowGroup()));
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    //     return ShowGroup();
    //   }));
    // });
    print("Change page!");
  }
}
