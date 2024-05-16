import 'package:flutter/material.dart';
// material

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// firebase

import 'package:code_star/helper/helper_functions.dart';
import 'package:code_star/shared_components/already_account_button.dart';
import 'package:code_star/shared_components/custom_text_form_field.dart';
import '../../shared_components/custom_button.dart';
// custom components

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();

  var _isObscured = true;
  var _isCwObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
    _isCwObscured = true;
  }

  // disposing the data in formfields
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _genderController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // dispose method is a lifeCycle method it is automatically called when wedget is permanetly removed

  // creating user in firebase with the entered information
  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      // show loading circle
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));

      // make sure password and confirm password matchs
      if (_passwordController.text != _confirmPasswordController.text) {
        //pop loading circle
        Navigator.pop(context);
        //todo Displayes message here coz password don't match but it would be better if we use this in validator and come to this phase after verifing this
        displayMessageToUser("Password don't match", context);
      } else {
        // register the user
        try {
          final userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          // send email varification link to the user
          await userCredential.user!.sendEmailVerification();
          print('Email verification link sent!');

          // save user data
          await _saveUserData(userCredential.user!.uid);

          // stop showing the loading circle
          Navigator.pop(context);

          // direct user to another page
          Navigator.pushReplacementNamed(context, '/emailSentInfo');
          // Navigates to email_sent_info page than from their user can click continue to get directed to homepage
        } on FirebaseAuthException catch (e) {
          // pop the circle
          Navigator.pop(context);
          // Display the error message
          if (e.code == 'weak-password') {
            displayMessageToUser('The password provided is too weak.', context);
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            displayMessageToUser(
                'The account already exists for that email.', context);
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
    }
  }

  // saving the data entered by the user in database/firestore

  Future<void> _saveUserData(String userId) async {
    final firestore = FirebaseFirestore.instance;

    // Create a new document or update existing one if desired
    await firestore.collection('users').doc(userId).set(
      {
        'id': userId,
        'username': _usernameController.text,
        'email': _emailController.text,
        'gender': _genderController.text,
        'age': int.parse(_ageController.text),
        // Ensure successful conversion to int
      },
    );
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
                      'R E G I S T E R',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // user name

                      MyTextFormField(
                        hintText: 'Username',
                        obscureText: false,
                        controller: _usernameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Username can not be empty' : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // email

                      MyTextFormField(
                          hintText: 'Email',
                          obscureText: false,
                          controller: _emailController,
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

                            // validation to show the format of email is not correct
                            // Email is already in use
                          }),
                      const SizedBox(
                        height: 10,
                      ),

                      //gender
                      MyTextFormField(
                        hintText: 'Gender',
                        obscureText: false,
                        controller: _genderController,
                        validator: (value) =>
                            value!.isEmpty ? 'Please type your gender' : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // age
                      MyTextFormField(
                        hintText: 'Age',
                        obscureText: false,
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your age';
                          } else if (int.tryParse(value) == null) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },
                      ),
                      // if value is below 13 age, age below 13 is not allowed
                      // if it is between 60 - 100, this app is not desigened for this your age group
                      // if it is more than 100 please enter a valid age),
                      const SizedBox(
                        height: 10,
                      ),
                      //password
                      MyTextFormField(
                        hintText: 'Password',
                        obscureText: _isObscured,
                        suffixIcon: IconButton(
                          icon: _isObscured
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        controller: _passwordController,
                        validator: (String? value) {
                          return value!.length < 6
                              ? 'Password must be at least 6 characters'
                              : null;

                          // password should just be 6 or more than 6
                        },
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //Confirm password
                      MyTextFormField(
                        hintText: 'Confirm password',
                        obscureText: _isCwObscured,
                        suffixIcon: IconButton(
                          icon: _isCwObscured
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isCwObscured = !_isCwObscured;
                            });
                          },
                        ),
                        controller: _confirmPasswordController,
                        validator: (String? value) {
                          return value!.length < 6
                              ? 'Password must be at least 6 characters'
                              : null;

                          // password should just be 6 or more than 6
                        },
                      ),

                      // Registration button
                      const SizedBox(
                        height: 50,
                      ),

                      CustomButton(
                        text: 'REGISTER',
                        onPressed: _registerUser,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      MyTextButton(
                        onTap: widget.onTap,
                        text: 'I ALREADY HAVE AN ACCOUNT',
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
