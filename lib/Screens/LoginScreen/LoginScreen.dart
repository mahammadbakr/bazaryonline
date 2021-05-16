import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Components/OTPBox.dart';
import 'package:online_bazar/Screens/HomeScreen/HomeScreen.dart';
import 'package:online_bazar/Screens/SignUpScreen/SignUpScreen.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';

import '../../Constants.dart';

class LoginScreen extends StatelessWidget {
  static const routeLoginScreen = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Constants.logoTrans,
              scale: 10,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'Login',
              style: theme(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
        leading: SizedBox.shrink(),
      ),
      backgroundColor: theme(context).backgroundColor,
      body: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  Constants.logo,
                  scale: 4,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: const InputDecoration(
                      hintText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                SizedBox(
                  height: 16,
                ),

                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.resolveWith(getColor),
                    ),
                    onPressed: () => Navigator.pushNamed(context, HomeScreen.routeHomeScreen),
                    child: Text(
                      'Log In',
                      style: theme(context).textTheme.headline5!.copyWith(
                          color: theme(context).backgroundColor),
                    )),

                TextButton(
                    onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeSignUpScreen),
                    child: Text(
                      'Sign Up',
                      style: theme(context).textTheme.bodyText2!.copyWith(
                          color: theme(context).primaryColor),
                    )),

                Spacer(),

                Align(child: Text('©bazaryonline'),alignment: Alignment.center,),
                SizedBox(
                  height: 40,
                ),

              ],
            ),
          )),

      // body: Center(
      //   child: TextButton(
      //     onPressed: () => Navigator.pushNamed(context, HomeScreen.routeHomeScreen),
      //     child: Text('Log In'),
      //   ),
      // ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff111921);
    }
    return Color(0xff328a8a);
  }
}
