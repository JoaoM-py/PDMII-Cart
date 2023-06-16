import 'package:flutter/material.dart';

final ThemeData tema = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(13, 0, 0, 1),
      titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
  ),
),


  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(13, 0, 0, 1)),
    ),

    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(33,191,191, 0.5)),
    ),

    prefixIconColor: Color.fromRGBO(191, 33, 46, 1)
  ),


  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor:  Color.fromRGBO(38,34,35, 0.8))
  )



);





