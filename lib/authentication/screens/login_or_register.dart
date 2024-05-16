import 'package:flutter/material.dart';
// material

import 'package:code_star/authentication/screens/registration_page.dart';
import 'login_page.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  LoginOrRegisterPageState createState() => LoginOrRegisterPageState();
}

class LoginOrRegisterPageState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages,);
    } else{
      return RegisterPage(onTap: togglePages);
    }
  }
}
