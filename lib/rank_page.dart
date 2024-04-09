import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Use for support for svg image formats



// rank3 starts

class rank3 extends StatelessWidget{
  const rank3({super.key});
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Scaffold(
      // Column is a vertical, linear layout.
      body: Column(
        children: [
          Container(
            child: SvgPicture.asset(
              'assets/images/rank.svg',
              width: 300,
            ),
            padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
          ),
          Container(
            child: Center(
              child: Text(
                'Attend quiz, get ranked',
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
                'Users should be ranked on the leaderboard as per pts scored in the quiz Users should be ranked on the leaderboard as per pts scored in the quiz  ',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    )),
                textAlign: TextAlign.center,
              ),
            ),
            margin: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 90),
          ),
          FilledButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(7.0), // Adjust the value as needed
                ),
                fixedSize: Size.fromWidth(350),
                padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),

                textStyle: GoogleFonts.roboto(
                  fontSize: 20, // Adjust the font size as needed
                  fontWeight:
                  FontWeight.bold, // Adjust the font weight as needed
                ),
              ),

              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Text('Get Started')),
        ],
      ),
    );
  }
}

// rank3 ends

