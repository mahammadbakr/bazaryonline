import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/CartTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/HomeTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/ProfileTab.dart';
import 'package:online_bazar/Screens/HomeScreen/Tabs/SearchTab.dart';

class AuthenticationProvider extends ChangeNotifier {

  late int selectedCityIndex= 0;
  late String selectedCity= citiesList[0];
  late String selectedProvince= provincesList[selectedCityIndex][0];


  int getSelectedCityIndex(){
    // ignore: unnecessary_null_comparison
    if(selectedCityIndex==null){
      return 0;
    }
    return selectedCityIndex;
  }

  void setSelectedCityIndex(int index){
    selectedCityIndex=index;
    notifyListeners();
  }

  String getSelectedCity(){
    // ignore: unnecessary_null_comparison
    if(selectedCity==null || selectedCity.isEmpty){
      return citiesList[0];
    }
    return selectedCity;
  }

  void setSelectedCity(String city){
    selectedCity=city;
    notifyListeners();
  }


  String getSelectedProvince(){
    // ignore: unnecessary_null_comparison
    if(selectedCity==null || selectedCity.isEmpty){
      return provincesList[selectedCityIndex][0];
    }
    return selectedProvince;
  }

  void setSelectedProvince(String province){
    selectedProvince=province;
    notifyListeners();
  }

  List<String> getProvincesByIndex(int cityIndex){
    return provincesList[cityIndex];
  }


  List<String> citiesList = [
    "Erbil",
    "Sulaymaniyah",
    "Duhok",
    "Halabja",
    "Kerkuk"
  ];
  List<List<String>> provincesList = [
    [
      "Erbil",
      "Dashty Hawler",
      "Koya",
      "Makhmur",
      "Soran",
      "Shaqlawa",
      "Mergasor ",
      "Choman",
      "Rawanduz",
      "Khabat"
    ],
    [
      "Sulaymaniyah",
      "Bazyan",
      "Kalar",
      "Pshdar",
      "Raniyah",
      "Kfree",
      "Chamchamal",
      "Darbandokeh",
      "Dukan",
      "Khanaqin",
      "Mawat",
      "Penjwen",
      "Qaradagh",
      "Saidsadiq",
      "Sharazur",
      "Sharbazher"
    ],
    ["Duhok", "Amedi", "Semel", "Zakho", "Akre", "Bardarash", "Shekhan"],
    ["Halabja", "Khurmal", "Hawraman"],
    ["Kirkuk", "Dibis", "Daquq", "Hawija"]
  ];

}
