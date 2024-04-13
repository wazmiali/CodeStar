import 'package:flutter/material.dart';

const Color primaryColor =
    Color(0xFF3F51B5); // Indigo (you can adjust the hue for variations)
const Color primaryColorDark = Color(0xFF303F9F); // Darker shade of indigo
const Color primaryColorLight = Color(0xFFC5CAE9); // Lighter shade of indigo
const Color accentColor = Colors.white; // Adjust if needed

// Define other necessary colors based on your desired theme

ThemeData get indigoTheme {
  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    // colorSchemeSeed: Color(0xFF3F51B5),
    // what is above property
    // 11.04.2024 I don't see any changes after creating and updating theme to indigoTheme
    useMaterial3: true,
    // Customize other theme properties as needed (e.g., text color, button theme)
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor, // Set app bar background color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
    // ... further customizations for text themes, etc.
  );
}
