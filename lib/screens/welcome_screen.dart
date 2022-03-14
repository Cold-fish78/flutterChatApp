import 'package:flutter/material.dart';
import 'package:flutter_chat/screens/login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_chat/screens/registration_screen.dart';
import 'package:flutter_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    // animation = CurvedAnimation(parent: animationController,curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);
    animationController.forward();

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: const Duration(microseconds: 100000),
                  repeatForever: false,
                  totalRepeatCount: 1,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedWidget(color: Colors.lightBlueAccent,title: 'Log In',onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedWidget(color: Colors.blueAccent, onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
              //Go to rNaiegistration screen.
            }, title: 'Register'),
          ],
        ),
      ),
    );
  }
}
