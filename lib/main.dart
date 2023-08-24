import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/my%20provider.dart';
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
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(pro.language),
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
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
