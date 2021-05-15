import 'package:flutter/cupertino.dart';

class Language with ChangeNotifier {
  // language dir
  String languageDirection='ltr';

  // language code
  String languageCode='en';

  void setLanguage(code, direction) async {
    languageCode = code;
    languageDirection = direction;
    notifyListeners();
  }

  Map<String, dynamic> get words => _words[languageCode];

  // language words
  Map _words = {
    'en': {},
    'kr': {},
  };
}
