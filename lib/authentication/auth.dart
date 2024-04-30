import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../appEntery/welcome_page.dart';
import '../modules/screens/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // check the current state of the auth of the user
        builder: (context, snapshot) {
          if(snapshot.hasData){
            // if the user is logged in show Home page
            return const Home();
          }else{
            // else show the Welcome page
            return WelcomePage();
          }
        },
      ),
    );
  }
}
