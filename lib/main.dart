import 'package:code_vidhya/authentication/screens/register_or_login.dart';
import 'package:flutter/material.dart';
// Use for support for svg image formats

import 'package:firebase_core/firebase_core.dart';
import 'authentication/screens/login_page.dart';
import 'firebase_options.dart';
 // firebase imports

import 'appEntery/rank_page.dart';
import 'appEntery/read_page.dart';
import 'appEntery/quiz_page.dart';
import 'appEntery/welcome_page.dart';
// lib

import 'authentication/screens/email_sent_info.dart';
// authentication/screens

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
      initialRoute: '/registerOrLogin',
      routes: {
        '/read1': (BuildContext ctx) => read1(),
        '/quiz2': (BuildContext ctx) => quiz2(),
        '/rank3': (BuildContext ctx) => rank3(),
        '/registerOrLogin': (BuildContext ctx) => RegisterOrLogin(),
        '/home': (BuildContext ctx) => Home(),
        '/emailSentInfo': (BuildContext ctx) => emailSentInfo(),
      },
      home: const WelcomePage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
