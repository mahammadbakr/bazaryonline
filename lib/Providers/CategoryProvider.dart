import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/CartTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/HomeTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/ProfileTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/SearchTab.dart';

enum CategoryType { men, women, clothing, posters, music }

class CategoryProvider extends ChangeNotifier {
  CategoryType currentCat = CategoryType.men;

  void setCurrentCategory(CategoryType cat) {
    currentCat = cat;
    notifyListeners();
  }

  CategoryType getCurrentCategory() {
    // ignore: unnecessary_null_comparison
    if (currentCat == null) {
      return CategoryType.men;
    }
    return currentCat;
  }

  List<String> categoryNames = ["Men", "Women", "Clothing", "Posters", "Music"];

  List<String> categoryImages = [
    "https://cdn0.iconfinder.com/data/icons/e-commerce-48/64/x-10-512.png",
    "https://cdn.pixabay.com/photo/2014/03/25/16/36/wedding-black-297510_640.png",
    "https://img.icons8.com/ios/452/shopping-bag--v1.png",
    "https://cdn2.iconfinder.com/data/icons/printing-linear-outline/300/185910184Untitled-3-512.png",
    "https://www.pinclipart.com/picdir/middle/562-5627127_music-icons-transparent-background-music-icon-transparent-background.png"
  ];
}
