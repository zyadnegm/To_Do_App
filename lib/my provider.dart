import 'package:flutter/material.dart';
class MyProvider extends ChangeNotifier {
  String language = "en";
  ThemeMode themeData = ThemeMode.light;

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }

  void changeMode(ThemeMode theme) {
    themeData = theme;
    notifyListeners();
  }
}