import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//PACAGES

import 'package:code_star/shared_components/already_account_button.dart';
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
        child: SingleChildScrollView(
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
                text: 'C O N T I N U E',
                onPressed: () => Navigator.pushNamed(context, '/read1'),
              ),
              SizedBox(
                height: 10,
              ),
              MyTextButton(
                onTap: () {
                  Navigator.pushNamed(context, '/loginOrRegister');
                },
                text: 'I ALREADY HAVE AN ACCOUNT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
