import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/HomeTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/ProfileTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/SearchTab.dart';

enum NavigationType { home, search, profile }

class AppSettingsProvider extends ChangeNotifier {
  NavigationType currentNav = NavigationType.home;

  void setNavigationType(int index) {
    index == 0
        ? currentNav = NavigationType.home
        : index == 1
            ? currentNav = NavigationType.search
            : currentNav = NavigationType.profile;
    notifyListeners();
  }

  int getCurrentNavigation() {
    // ignore: unnecessary_null_comparison
    if (currentNav == null) {
      return 0;
    }
    int index;
    currentNav == NavigationType.home
        ? index = 0
        : currentNav == NavigationType.search
            ? index = 1
            : index = 2;
    return index;
  }

  Widget getCurrentNavigationTab() {
    Widget tab;
    currentNav == NavigationType.home
        ? tab = HomeTab()
        : currentNav == NavigationType.search
            ? tab = SearchTab()
            : tab = ProfileTab();
    return tab;
  }

  String getCurrentNavigationTabName() {
    String tabName;
    currentNav == NavigationType.home
        ? tabName = "Home"
        : currentNav == NavigationType.search
            ? tabName = "Search"
            : tabName = "Profile";
    return tabName;
  }

  List<String> navigationNames = ["Home", "Search", "Profile"];

  List<Widget> navigationIcons = [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person)
  ];
}
