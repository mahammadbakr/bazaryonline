import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Components/MainAppBar.dart';
import 'package:online_bazar/Components/MainDrawer.dart';
import 'package:online_bazar/Constants.dart';
import 'package:online_bazar/Providers/AppSettingsProvider.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeHomeScreen = '/home';

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context, listen: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Constants.appBarHeight),
        child: MainAppBar(
          context: context,
          title: settings.getCurrentNavigationTabName(),
          icon: Icons.menu,
        ),
      ),
      drawer: MainDrawer(),
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: theme(context).backgroundColor,
      body: settings.getCurrentNavigationTab(),
      bottomNavigationBar: Consumer<AppSettingsProvider>(
        builder: (_, state, __) => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: state.navigationIcons[0],
              label: state.navigationNames[0],
            ),
            BottomNavigationBarItem(
              icon: state.navigationIcons[1],
              label: state.navigationNames[1],
            ),
            BottomNavigationBarItem(
              icon: state.navigationIcons[2],
              label: state.navigationNames[2],
            ),
            BottomNavigationBarItem(
              icon: state.navigationIcons[3],
              label: state.navigationNames[3],
            ),
          ],
          backgroundColor: theme(context).backgroundColor,
          unselectedItemColor: theme(context).accentColor,
          selectedLabelStyle: theme(context).textTheme.bodyText2,
          unselectedLabelStyle: theme(context).textTheme.bodyText2,
          currentIndex: state.getCurrentNavigation(),
          selectedItemColor: theme(context).primaryColor,
          onTap: (newState) {
            state.setNavigationType(newState);
          },
        ),
      ),
    );
  }
}
