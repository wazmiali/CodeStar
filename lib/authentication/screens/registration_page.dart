import 'package:flutter/material.dart';
// material

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// firebase

import 'package:google_fonts/google_fonts.dart';
// pub dependencies

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();

  var _isObscured;

  @override
  void initState(){
    _isObscured = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    super.dispose();
  }

// dispose method is a lifeCycle method it is automatically called when wedget is permanetly removed

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await userCredential.user!.sendEmailVerification();
        print('Email verification link sent!');

        //  Save additional user data (gender and age) to a database
        await _saveUserData(userCredential.user!.uid);

        // Navigates to home page or profile page after successful registration
        Navigator.pushReplacementNamed(context, '/emailSentInfo');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _saveUserData(String userId) async {
    final firestore = FirebaseFirestore.instance;

    // Create a new document or update existing one if desired

    await firestore.collection('users').doc(userId).set(
      {
        'id': userId,
        'email': _emailController.text,
        'gender': _genderController.text,
        'age': int.parse(_ageController.text),
        // Ensure successful conversion to int
      },
    );
    print('Gender: ${_genderController.text}, Age: ${_ageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Register',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                       TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            final RegExp emailRegExp = RegExp(
                                r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

                            if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email address.';
                            }

                            return null;
                          }

                          // validation to show the format of email is not correct
                          // Email is already in use
                          ),
                      TextFormField(
                        controller: _genderController,
                        decoration: InputDecoration(labelText: 'Gender'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please type your gender' : null,

                       ),
                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Age'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your age';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },

                        // if value is below 13 age, age below 13 is not allowed
                        // if it is between 60 - 100, this app is not desigened for this your age group
                        // if it is more than 100 please enter a valid age
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
                       // Registration button
                      SizedBox(
                        height: 50,
                      ),

                      FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                7.0), // Adjust the value as needed
                          ),
                          fixedSize: Size.fromWidth(350),
                          padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
                          textStyle: GoogleFonts.roboto(
                            fontSize: 20, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .bold, // Adjust the font weight as needed
                          ),
                        ),

                        onPressed: _registerUser,

                        child: Text('REGISTER'),
                      ),

                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue[900],
                          padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
                          textStyle: GoogleFonts.roboto(
                            fontSize: 18, // Adjust the font size as needed
                            // Adjust the font weight as needed
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('I ALREADY HAVE AN ACCOUNT'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
