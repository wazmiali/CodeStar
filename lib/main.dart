import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Use for support for svg image formats

import 'rank_page.dart';
import 'read_page.dart';
import 'quiz_page.dart';
import 'welcome_page.dart';
// Imported files

void main() { runApp(myApp());}

class myApp extends StatelessWidget {
  const myApp ({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Code Vidhya',
      // used by the OS task switcher
      initialRoute: '/',
      routes: {
         '/read1':(BuildContext ctx) => read1(),
        '/quiz2':(BuildContext ctx) => quiz2(),
        '/rank3':(BuildContext ctx) => rank3(),
      },
      theme: ThemeData(colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      //above telling SDK to use Meterial3 and generate widget provide by Material 3
      home:  WelcomePage(),
    );

  }
}



