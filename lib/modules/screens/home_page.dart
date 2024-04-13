import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
// firebase

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser?.uid);
    }

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            child: Center(
              child: Text(
                'Welcome to Homepage',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            margin: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 450),
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
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Log out')),
        ]),
      ),
    );
  }
}
