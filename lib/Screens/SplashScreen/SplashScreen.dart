import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Constants.dart';
import 'package:online_bazar/Screens/HomeScreen/HomeScreen.dart';
import 'package:online_bazar/Screens/LoginScreen/LoginScreen.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';

class SplashScreen extends StatefulWidget {
  static const routeHomeScreen = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      // Do Something Before it Goes to Home Screen

      Navigator.pushNamed(context, LoginScreen.routeLoginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme(context).backgroundColor,
      body: Center(
        child: Image.asset(Constants.logo,scale: 4,),
      ),
      // body: Center(
      //   child: CircularProgressIndicator(
      //     backgroundColor: theme(context).backgroundColor,
      //     valueColor:
      //         new AlwaysStoppedAnimation<Color>(theme(context).primaryColor),
      //   ),
      // ),
    );
  }
}
