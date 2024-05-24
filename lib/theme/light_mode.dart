import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.blue.shade200,
      secondary: Colors.blue.shade200,
      inversePrimary: Colors.blue.shade800,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all(const BorderSide(color:Color.fromARGB(102, 0, 127, 255))),
          // surfaceTintColor: MaterialStateProperty.all(Colors.blue),
        )),
    textTheme: ThemeData
        .light()
        .textTheme
        .apply(bodyColor: Colors.black, displayColor: Colors.black
      // todo How to specify the fontfamily used
      //
    ));


// backgroundColor : Theme.of(context).colorScheme.background
// color : Theme.of(context).colorScheme.inversePrimary