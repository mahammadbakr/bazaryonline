import 'package:flutter/material.dart';
import 'package:online_bazar/Providers/AppSettingsProvider.dart';
import 'package:online_bazar/Providers/AuthenticationProvider.dart';
import 'package:online_bazar/Providers/CategoryProvider.dart';
import 'package:online_bazar/Screens/HomeScreen/HomeScreen.dart';
import 'package:online_bazar/Screens/LoginScreen/LoginScreen.dart';
import 'package:online_bazar/Screens/SignUpScreen/SignUpScreen.dart';
import 'package:provider/provider.dart';

import 'Helper/Theme.dart';
import 'Screens/SplashScreen/SplashScreen.dart';

void main() {
  //STARTUP APPLICATION
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //GENERATE PROVIDERS
      providers: [
        ChangeNotifierProvider<AppSettingsProvider>(
          create: (context) => AppSettingsProvider(),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Online Bazar',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        //GENERATE ROUTES
        initialRoute: SplashScreen.routeHomeScreen,
        routes: {
          SplashScreen.routeHomeScreen: (context) => SplashScreen(),
          HomeScreen.routeHomeScreen: (context) => HomeScreen(),
          LoginScreen.routeLoginScreen: (context) => LoginScreen(),
          SignUpScreen.routeSignUpScreen: (context) => SignUpScreen(),
        },
      ),
    );
  }
}
