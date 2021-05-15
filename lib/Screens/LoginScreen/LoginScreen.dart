import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Text('login screen'),
      ),
    );
  }
}
