import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:code_vidhya/authentication/screens/register_or_login.dart';
import '../modules/screens/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const Home();
          }else{
            return RegisterOrLogin();
          }
        },
      ),
    );
  }
}
