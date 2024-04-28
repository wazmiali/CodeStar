import 'package:code_vidhya/helper/helper_functions.dart';
import 'package:code_vidhya/shared_components/custom_TextFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
// firebase

import 'package:flutter/material.dart';
// material

import 'package:google_fonts/google_fonts.dart';
// pub dependencies

import '../../shared_components/custom_button.dart';
// custom components

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    if (_formKey.currentState!.validate()) {
      // show loading circle
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
      try {
        // login the user
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // pop loading circle
        Navigator.pop(context);
        // navigate to home page
        Navigator.pushReplacementNamed(context, '/home');
        // when pushReplacementNamed is used we can not go back by clicking back button
      } on FirebaseAuthException catch (e) {
        // pop loading cicle
        Navigator.pop(context);

        // display error if cought any
        if (e.code == 'user-not-found') {
          print('No user found for that email');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
          displayMessageToUser(e.code, context);
      } catch (e) {
        print(e);
      }
    }
  }

  var _isObscured;

  @override
  void initState() {
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
                SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.person_pin,
                  size: 180,
                ),
                Container(
                  child: Center(
                    child: Text(
                      'L O G I N',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email and password text fields

                      MyTextFormFeild(
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
                      SizedBox(
                        height: 10,
                      ),

                      MyTextFormFeild(
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

                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                        child: CustomButton(
                          text: 'LOG IN',
                          onPressed: login,
                        ),
                      ),

                      CustomButton(
                        backgroundColor: Color(0xff9d9d9d),
                        text: 'REGISTER',
                        onPressed: widget.onTap,
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
