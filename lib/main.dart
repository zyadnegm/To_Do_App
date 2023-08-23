import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/screens/Edit_screen.dart';
import 'package:todo/screens/Example.dart';
import 'package:todo/screens/settings.dart';
import 'package:todo/shared/style/theming/my_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
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
        Edit_screen.routeName: (context) => Edit_screen(),
        Settings_screen.routeName: (context) => Settings_screen(),
        DropdownMenuApp_sreen.routeName: (context) => DropdownMenuApp_sreen()
      },
      theme: My_theme.LightTheme,
      darkTheme: My_theme.darkTheme,
    );
  }
}
