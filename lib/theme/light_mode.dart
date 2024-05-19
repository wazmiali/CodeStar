import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.blue.shade200,
      secondary: Colors.blue.shade200,
      inversePrimary: Colors.blue.shade800,
    ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.black,
    displayColor: Colors.black
      // todo How to specify the fontfamily used
    //
  )

);