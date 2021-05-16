import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Components/MainTextFormField.dart';
import 'package:online_bazar/Components/OTPBox.dart';
import 'package:online_bazar/Providers/AuthenticationProvider.dart';
import 'package:online_bazar/Screens/HomeScreen/HomeScreen.dart';
import 'package:online_bazar/Screens/LoginScreen/LoginScreen.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';

class SignUpScreen extends StatefulWidget {
  static const routeSignUpScreen = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = new TextEditingController();

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
                'Sign Up',
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
        body: Consumer<AuthenticationProvider>(
          builder: (_, authState, __) => Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Fill Below form please"),
                    SizedBox(
                      height: 12,
                    ),

                    MainTextFormField(
                      label: 'First Name',
                      hint: ' Enter your first name',
                      controller: firstNameController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    MainTextFormField(
                      label: 'Last Name',
                      hint: ' Enter last name',
                      controller: firstNameController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MainTextFormField(
                      label: 'Phone Number',
                      hint: ' Enter your phone number',
                      controller: firstNameController,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        initialValue: "Iraq",
                        enabled: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              gapPadding: 5,
                            ),
                            labelText: "Country",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 14)),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Choose City"),
                    DropdownButton<String>(
                      value: authState.getSelectedCity(),
                      icon: const Icon(Icons.location_city_rounded),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: theme(context).accentColor),
                      onChanged: (String? newValue) {
                        setState(() {
                          authState.setSelectedCity(newValue!);
                          // print(authState.citiesList.indexWhere((element) => element==newValue));
                          authState.setSelectedCityIndex(authState.citiesList
                              .indexWhere((element) => element == newValue));
                          authState.setSelectedProvince(authState.getProvincesByIndex(authState.selectedCityIndex)[0]);
                        });
                      },
                      items: authState.citiesList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Choose Province"),
                    DropdownButton<String>(
                      value: authState.getSelectedProvince(),
                      icon: const Icon(Icons.map_outlined),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: theme(context).accentColor),
                      onChanged: (String? newValue) {
                        setState(() {
                          authState.setSelectedProvince(newValue!);
                        });
                      },
                      items: authState
                          .getProvincesByIndex(authState.selectedCityIndex)
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    MainTextFormField(
                      label: 'Address',
                      hint: ' Enter your address',
                      controller: firstNameController,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith(getColor),
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, HomeScreen.routeHomeScreen),
                        child: Text(
                          'Sign Up',
                          style: theme(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: theme(context).backgroundColor),
                        )),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, LoginScreen.routeLoginScreen),
                        child: Text(
                          'Have account already ?',
                          style: theme(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: theme(context).primaryColor),
                        ))
                  ],
                ),
              )),

          // body: Center(
          //   child: TextButton(
          //     onPressed: () => Navigator.pushNamed(context, HomeScreen.routeHomeScreen),
          //     child: Text('Log In'),
          //   ),
          // ),
        ));
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
