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

  var _isObscured;

  @override
  void initState(){
    _isObscured = true;
  }

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
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
                margin: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 100),
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
                        decoration: InputDecoration(labelText: 'Password',
                            suffixIcon: IconButton(
                              padding: const EdgeInsetsDirectional.only(end:12.0),
                              icon: _isObscured? const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                              onPressed: (){
                                setState(() {
                                  _isObscured =!_isObscured;
                                });
                              },
                            )
                        ),
                        obscureText: _isObscured,
                        validator: (String? value) {
                          return value!.length < 6
                              ? 'Password must be at least 6 characters'
                              : null;

                          // password should just be 6 or more than 6
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top:60.0, bottom: 10.0),
                      child: FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(7.0), // Adjust the value as needed
                          ),
                          fixedSize: Size.fromWidth(350),
                          padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
                          textStyle: GoogleFonts.roboto(
                            fontSize: 20, // Adjust the font size as needed
                            fontWeight: FontWeight.bold, // Adjust the font weight as needed
                          ),
                        ),
          
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
                        },                  child: Text('LOG IN'),
                      ),
                    ),
                    FilledButton(
          
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
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
          
                        onPressed: () => Navigator.pushNamed(context, '/register'),
                        child: Text('REGISTER')),
          
          
                  ],
                ),
              ),
            ],
                  ),
          ),
        ),),
    );
  }
}
