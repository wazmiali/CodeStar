
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// firebase



// Logout page below

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      user.reload(); // Fetch latest user data
      if (user.emailVerified) {
        final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
        userRef.update({'isVerified': true});
      } else {
        final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
        userRef.update({'isVerified': false});
      }
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
                final user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  await user.reload();
                  // Fetch latest user data
                  final isVerified = user.emailVerified;
                  if (isVerified) {
                    // User verified,proceed with logout
                    if (user != null) {
                      final userRef = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid);
                      await userRef.update({
                        'isVerified': isVerified
                      }); // Update verification status in Firestore
                      await FirebaseAuth.instance
                          .signOut(); // Logout user from Firebase Authentication
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  } else {
                    await FirebaseAuth.instance
                        .signOut(); // Logout user from Firebase Authentication
                    Navigator.pushReplacementNamed(context, '/login');
                    // User not verified, show a message or handle accordingly
                  }
                }
              },
              child: Text('Log out')),
        ]),
      ),
    );
  }
}
