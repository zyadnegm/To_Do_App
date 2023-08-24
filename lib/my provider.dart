import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String language = "en";

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}
