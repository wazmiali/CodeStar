import 'package:flutter/material.dart';
// Use for support for svg image formats

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
 // firebase imports

import 'rank_page.dart';
import 'read_page.dart';
import 'quiz_page.dart';
import 'welcome_page.dart';
// lib

import 'authentication/screens/registration_page.dart';
import 'authentication/screens/login_page.dart';
import 'authentication/screens/email_sent_info.dart';
// authentication/screens
import 'modules/screens/home_page.dart';
// moduels/screens

// custom theme
// Imported files

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Vidhya',
      // used by the OS task switcher
      initialRoute: '/register',
      routes: {
        '/read1': (BuildContext ctx) => read1(),
        '/quiz2': (BuildContext ctx) => quiz2(),
        '/rank3': (BuildContext ctx) => rank3(),
        '/register': (BuildContext ctx) => RegisterPage(),
        '/home': (BuildContext ctx) => home(),
        '/login': (BuildContext ctx) => LoginPage(),
        '/emailSentInfo': (BuildContext ctx) => emailSentInfo(),


      },
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff008fff), useMaterial3: true),
      //above telling SDK to use Meterial3 and generate widget provide by Material 3
      // changing color of colorSchemeSeed the color of buttons and textField outline is changing

      home: WelcomePage(),
    );
  }
}
