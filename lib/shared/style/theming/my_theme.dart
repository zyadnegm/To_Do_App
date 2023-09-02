import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_color.dart';

class My_theme {
  static ThemeData LightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        iconTheme: IconThemeData(color: primarycolor),
        backgroundColor: Color(0Xff5D9CEC),
      ),
      scaffoldBackgroundColor: Color(0XffDFECDB),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: primarycolor,
        unselectedItemColor: Colors.grey,
      ));
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        iconTheme: IconThemeData(color: darkprimarycolor),
        backgroundColor: Color(0Xff5D9CEC),
        elevation: 0.0,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.bold, color: yellowcolor),
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, fontWeight: FontWeight.bold, color: yellowcolor),
      ),
      scaffoldBackgroundColor: Color(0Xff060E1E),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: darkprimarycolor,
        selectedItemColor: primarycolor,
        unselectedItemColor: Colors.white,
      ));
}
