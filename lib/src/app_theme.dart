import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appThemeData = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.blue,
  textTheme: GoogleFonts.ibmPlexSansTextTheme().copyWith(
    bodyText1: TextStyle(fontSize: 14),
    bodyText2: TextStyle(fontSize: 14),
    button: TextStyle(fontSize: 14),
  ),
  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Color(0xff4f4f4f),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    labelPadding: EdgeInsets.zero,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 20, 84, 104),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    textStyle: TextStyle(fontSize: 14),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    primary: Color.fromARGB(255, 31, 119, 145),
    onPrimary: Color(0xfff1f1f1),
    secondary: Color.fromARGB(255, 145, 103, 175),
    onSecondary: Color(0xfff1f1f1),
    outline: Color.fromARGB(255, 199, 199, 199),
  ),
  // colorScheme: ColorScheme.dark(),
);
