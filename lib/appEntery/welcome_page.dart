import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared_components/custom_button.dart';
// custom components
// Home screen/welcome starts
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Column is a vertical, linear layout.
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/images/CodeStar.png',
                width: 250,
              ),
              padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Welcome to codeStar',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              margin: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Dive into our curated modules, study at your own pace, and put your knowledge to the test with personalized quizzes.',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  )),
                  textAlign: TextAlign.center,
                ),
              ),
              margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 95),
            ),
            CustomButton(
              text: 'CONTINUE',
              onPressed: () => Navigator.pushNamed(context, '/read1'),
            ),

            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue[900],
                padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
                textStyle: GoogleFonts.roboto(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('I ALREADY HAVE AN ACCOUNT'),
            ),
          ],
                ),
        ),),
    );
  }
}
