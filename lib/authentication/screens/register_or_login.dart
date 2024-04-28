import 'package:code_vidhya/authentication/screens/registration_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
// material

class RegisterOrLogin extends StatefulWidget {
  @override
  LoginOrRegisterPageState createState() => LoginOrRegisterPageState();
}

class LoginOrRegisterPageState extends State<RegisterOrLogin> {
  bool showRegisterPage = true;

  togglePages() {
    setState(() {
      showRegisterPage = !showRegisterPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showRegisterPage) {
      return RegisterPage(onTap: togglePages);
    } else{
      return LoginPage(onTap: togglePages,);
    }
  }
}
