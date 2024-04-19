import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class emailSentInfo extends StatelessWidget {
  const emailSentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Icon(
              Icons.mark_email_unread_outlined,
              color: Colors.blue,
              size: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Text(
              'We have sent a confirmation email to your indox, please confirm your email for future updates from codeStar',
               style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
          FilledButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[500],
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
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('CONTINUE')),
        ]),
      ),
    );
  }
}
