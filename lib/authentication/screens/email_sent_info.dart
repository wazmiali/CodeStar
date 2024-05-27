import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_components/custom_button.dart';
// custom components

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
              color: Colors.pink[200],
              size: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Text(
              'We have sent a confirmation email to your inbox and spam, please confirm your email for future updates from codeStar',
               style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),

              CustomButton(
                backgroundColor: Color(0xfff48fb1),
                text: 'CONTINUE',
                onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              ),
      ],
      ),
      ),
    );
  }
}
