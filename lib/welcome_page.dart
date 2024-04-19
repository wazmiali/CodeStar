import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Use for support for svg image formats

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
            FilledButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[5000],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(7.0), // Adjust the value as needed
                ),
                fixedSize: Size.fromWidth(350),
                padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
                textStyle: GoogleFonts.roboto(
                  fontSize: 20, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Adjust the font weight as needed
                ),
          
              ),
              onPressed: () => Navigator.pushNamed(context, '/read1'),
              child: Text('CONTINUE'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue[900],
                padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
                textStyle: GoogleFonts.roboto(
                  fontSize: 18, // Adjust the font size as needed
                  // Adjust the font weight as needed
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
