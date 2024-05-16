import 'package:flutter/material.dart';
// material

import 'package:code_star/Profile/screens/profile_page.dart';
// Profile

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
 // firebase imports

import 'Leaderboard/screens/leaderboard_page.dart';
// Leaderboard

import 'appEntry/rank_page.dart';
import 'appEntry/read_page.dart';
import 'appEntry/quiz_page.dart';
// appEntery

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
  const MyApp({super.key});

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
        '/authPage' :(BuildContext ctx) => AuthPage(),
        '/leaderBoard' :(BuildContext ctx) => leaderboard(),
        '/profilePage' :(BuildContext ctx) => Profile(),
        '/moduleList' :(BuildContext ctx) => ModuleList(),
      },
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
