import 'package:flutter/material.dart';
import '../settings.dart';

class CustomTheme {
  final _maintheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Settings.darkBlueColor,
      textTheme: TextTheme(
        body1: TextStyle(fontFamily: "OpenSans"),
        body2: TextStyle(fontFamily: "OpenSans"),
        title: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        subtitle: TextStyle(fontFamily: "OpenSans"),
        button: TextStyle(fontFamily: "OpenSans"),
        caption: TextStyle(fontFamily: "OpenSans"),
        headline: TextStyle(fontFamily: "OpenSans"),
        overline: TextStyle(fontFamily: "OpenSans"),
        subhead: TextStyle(fontFamily: "OpenSans"),
        display1: TextStyle(fontFamily: "OpenSans"),
        display2: TextStyle(fontFamily: "OpenSans"),
        display3: TextStyle(fontFamily: "OpenSans"),
        display4: TextStyle(fontFamily: "OpenSans"),
      ),
    ),
    backgroundColor: Colors.white70,
    primaryColor: Settings.darkBlueColor,
    accentColor: Settings.blueColor,
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.all(20),
      buttonColor: Color.fromRGBO(52, 67, 87, 1.0),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Settings.darkBlueColor,
    ),
    textTheme: TextTheme(
      body1: TextStyle(fontFamily: "OpenSans"),
      body2: TextStyle(fontFamily: "OpenSans"),
      title: TextStyle(fontFamily: "OpenSans"),
      subtitle: TextStyle(fontFamily: "OpenSans"),
      button: TextStyle(fontFamily: "OpenSans"),
      caption: TextStyle(fontFamily: "OpenSans"),
      headline: TextStyle(fontFamily: "OpenSans"),
      overline: TextStyle(fontFamily: "OpenSans"),
      subhead: TextStyle(fontFamily: "OpenSans", fontSize: 14),
      display1: TextStyle(fontFamily: "OpenSans"),
      display2: TextStyle(fontFamily: "OpenSans"),
      display3: TextStyle(fontFamily: "OpenSans"),
      display4: TextStyle(fontFamily: "OpenSans"),
    ),
  );

  ThemeData get mainTheme => _maintheme;
}
