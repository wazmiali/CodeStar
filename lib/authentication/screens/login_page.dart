import 'package:firebase_auth/firebase_auth.dart';
// firebase

import 'package:flutter/material.dart';
// material

import 'package:google_fonts/google_fonts.dart';
// pub dependencies

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                'Login',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            margin: EdgeInsetsDirectional.fromSTEB(0, 160, 0, 100),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Email and password text fields
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your email' : null,
                ),

                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) => value!.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                // Registration button
                SizedBox(
                  height: 50,
                ),
                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        // Navigate to home page or profile page after successful Login
                        Navigator.pushReplacementNamed(context, '/home');
                        // when pushReplacementNamed is used we can not go back by clicking back button
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text('Log in'),
                ),
              ],
            ),
          ),
        ],
      ),),
    );
  }
}
