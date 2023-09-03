import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/user_nodel.dart';
import 'package:todo/shared/network/firebase/firebase_function.dart';

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

class Login_provider extends ChangeNotifier {
  User_model? user_model;
  User? firebaseuser;

  Login_provider() {
    firebaseuser = FirebaseAuth.instance.currentUser;
    if (firebaseuser != null) {
      initUser();
    }
  }

  Future<void> initUser() async {
    firebaseuser = FirebaseAuth.instance.currentUser;
    user_model = await Firebase_function.readUser(firebaseuser!.uid);
    notifyListeners();
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
