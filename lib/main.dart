import 'package:code_star/settings/settings.dart';
import 'package:flutter/material.dart';
// material

import 'package:code_star/Profile/screens/profile_page.dart';
// Profile

import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
// firebase imports

import 'Leaderboard/screens/leaderboard_page.dart';
// Leaderboard

import 'appEntry/rank_page.dart';
import 'appEntry/read_page.dart';
import 'appEntry/quiz_page.dart';
// appEntry

import 'package:code_star/authentication/auth.dart';
import 'authentication/screens/login_or_register.dart';
import 'package:code_star/authentication/screens/register_or_login.dart';
import 'authentication/screens/email_sent_info.dart';
// authentication/screens

import 'package:code_star/modules/screens/module_list_page.dart';
import 'modules/screens/home_page.dart';
// modules/screens

import 'theme/dark_mode.dart';
import 'theme/light_mode.dart';

// custom theme
// Imported files

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(
        fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
    displayMedium: GoogleFonts.roboto(
        fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
    displaySmall: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
    headlineMedium: GoogleFonts.roboto(
        fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    headlineSmall:
        GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
    titleLarge: GoogleFonts.roboto(
        fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleMedium: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
    titleSmall: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
    bodyMedium: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
    labelLarge: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
    bodySmall: GoogleFonts.roboto(
        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    labelSmall: GoogleFonts.roboto(
        fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Vidhya',
      // used by the OS task switcher
      // initialRoute: '/moduleList',
      routes: {
        '/read1': (BuildContext ctx) => read1(),
        '/quiz2': (BuildContext ctx) => quiz2(),
        '/rank3': (BuildContext ctx) => rank3(),
        '/registerOrLogin': (BuildContext ctx) => RegisterOrLogin(),
        '/loginOrRegister': (BuildContext ctx) => LoginOrRegister(),
        '/home': (BuildContext ctx) => Home(),
        '/emailSentInfo': (BuildContext ctx) => emailSentInfo(),
        '/authPage': (BuildContext ctx) => AuthPage(),
        '/leaderBoard': (BuildContext ctx) => Leaderboard(),
        '/profilePage': (BuildContext ctx) => Profile(),
        '/moduleList': (BuildContext ctx) => ModuleList(),
        '/settings': (BuildContext ctx) => Settings(),
      },
      home: const AuthPage(),
      // home: Settings(),
      theme: ThemeData(
          // Todo: I could just write custom styling for every components I use for example I use outlined button in the such way so i could style them like that by default
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(
            background: Colors.white,
            primary: Colors.blue.shade200,
            secondary: Colors.blue.shade200,
            inversePrimary: Colors.blue.shade800,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
            side: MaterialStateProperty.all(const BorderSide(
                color: Color.fromARGB(102, 0, 127, 255), width: 2)),
            // surfaceTintColor: MaterialStateProperty.all(Colors.blue),
          )),
          textTheme: textTheme),
      // darkTheme: darkMode,
    );
  }
}
