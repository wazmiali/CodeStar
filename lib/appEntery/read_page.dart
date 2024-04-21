import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Use for support for svg image formats

import '../shared_components/custom_button.dart';
// custom components

// read1 starts

class read1 extends StatelessWidget {
  const read1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Column is a vertical, linear layout.
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: SvgPicture.asset(
                'assets/images/read.svg',
                width: 300,
              ),
              padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
            ),
            Container(
              child: Center(
                child: Text(
                  'Read with codeStar',
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
                  'Users should be able to study the topic Users should be able to study the topic Users should be able to study the topic ',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  )),
                  textAlign: TextAlign.center,
                ),
              ),
              margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 80),
            ),

            CustomButton(
              text: 'NEXT',
              onPressed: () => Navigator.pushNamed(context, '/quiz2'),
            ),
          ],
        ),
      ),
    );
  }
}

// read1 ends
