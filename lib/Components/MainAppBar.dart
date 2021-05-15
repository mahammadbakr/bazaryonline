import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';

class MainAppBar extends StatelessWidget {
  final BuildContext context;
  final String title;
  final IconData icon;
  // final Function onPressed;

  MainAppBar(
      {required this.context,required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Builder(
        builder: (context) => IconButton(
            icon: Icon(
              icon,
              color: theme(context).backgroundColor,
            ),
            onPressed: ()=> Scaffold.of(context).openDrawer()),
      ),
    );
  }
}
