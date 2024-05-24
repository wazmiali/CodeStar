import 'package:code_star/helper/helper_functions.dart';
import 'package:code_star/shared_components/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
// firebase

import 'package:flutter/material.dart';
// material

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

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (!mounted) return;
        // pop loading circle
        Navigator.pop(context);
        // navigate to home page
        Navigator.pushReplacementNamed(context, '/home');
        // when pushReplacementNamed is used we can not go back by clicking back button
      } on FirebaseAuthException catch (e) {
        // pop loading circle
        Navigator.pop(context);

        // display error if caught any
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

  var _isObscured = false;

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
                const Icon(
                  Icons.person_pin,
                  size: 180,
                ),
                Center(
                  child: Text(
                    'L O G I N',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email and password text fields

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
                      SizedBox(
                        height: 10,
                      ),

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

                      SizedBox(
                        height: 50,
                      ),

                      CustomButton(
                        text: 'LOG IN',
                        onPressed: login,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        backgroundColor: Color(0xff000000),
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
