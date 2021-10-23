import 'package:flutter/material.dart';

class AppTheme {
//  ///Neumorphic Colors
  static Color mC = Colors.grey.shade100;
  static Color mCL = Colors.white;
  static Color mCD = Colors.black.withOpacity(0.075);
  static Color mCC = Colors.green.withOpacity(0.65);
  static Color fCD = Colors.grey.shade700;
  static Color fCL = Colors.grey;
  static Color shadowColor = Colors.grey.shade100;
  static Color lightShadowColor = Colors.white;

  /// Oficion color
  static Color orange = Color(0xfffd7e14);
  static Color danger = Color(0xffdc3545);
  static Color warning = Color(0xffffc107);
  static Color dark = Color(0xff343a40);
  static Color darkBlue = Color(0xff223263);
  static Color lightGrey = Color(0xffEBF0FF);

//  static Color primary = Color(0xff007bff);
  static Color grey = Color(0xff9098B1);
  static Color selectedBackgroundColor = Color(0xffe3effa);

  static Color facebookColor = Color(0xff3D579E);
  static Color linkedInColor = Color(0xff0076B4);
  static Color twitterColor = Color(0xff55ABEE);
  static Color primaryRed = Color(0xffFB7181);

//  static Color colorPrimary = Color(0xff0A5394);
  static Color colorPrimary = Color(0xff40bfff);
  static Color colorPrimaryDark = Color(0xffF7E01E);
  static Color colorAccent = Color(0xff40bfff);
  static Color lightScaffoldColor = Colors.grey.shade100;
  static Color lightBackgroundColorColor = Colors.white;

  static Color darkBG = Colors.grey.shade900;
  static Color darkScaffoldColor = Colors.grey.shade800;

  static Color textColorBlack = Colors.black;
  static Color textColorWhite = Colors.grey.shade100;
  static Color darkErrorColor = Color(0xffff5630);

  // Exam Screen
  static Color attemptedColor = Colors.green;
  static Color notAttemptedColor = Colors.grey.shade500;
  static Color markedForReviewColor = Colors.orange.shade700;

  static var defaultLinearGradient = LinearGradient(
//      colors: [Color(0xFFFB415B), Color(0xFFEE5623)],
      colors: [colorPrimary, colorAccent],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft);

  static var lightLinearGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.grey.shade100, Colors.white]);

  static var darkLinearGradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [Colors.grey.shade600, Colors.grey.shade500]);

  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Poppins",
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: lightBackgroundColorColor,
    primaryColor: colorPrimary,
    accentColor: colorAccent,
    scaffoldBackgroundColor: lightScaffoldColor,
    buttonColor: colorPrimary,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      textTheme: TextTheme(
          headline6: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      )),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    errorColor: darkErrorColor,
    backgroundColor: darkBG,
    primaryColor: colorPrimaryDark,
    accentColor: colorPrimaryDark,
    scaffoldBackgroundColor: darkScaffoldColor,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          headline6: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      )),
    ),
  );
}
