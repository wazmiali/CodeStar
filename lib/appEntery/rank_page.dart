import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Use for support for svg image formats

import '../shared_components/custom_button.dart';
// custom components


// rank3 starts

class rank3 extends StatelessWidget{
  const rank3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Column is a vertical, linear layout.
      body: SafeArea(
        child:Column(
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

          CustomButton(
            text: 'Get Started',
            onPressed: () => Navigator.pushNamed(context, '/register'),
           ),

        ],
      ),),
    );
  }
}

// rank3 ends

