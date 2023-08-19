import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/screens/settings.dart';
import 'package:todo/shared/style/theming/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_layout.routeName,
      routes: {
        Home_layout.routeName: (context) => Home_layout(),
        Settings.routeName: (context) => Settings()
      },
      theme: My_theme.LightTheme,
      darkTheme: My_theme.darkTheme,
    );
  }
}
