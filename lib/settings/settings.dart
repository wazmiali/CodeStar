import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// firebase

import 'package:code_star/shared_components/custom_button.dart';
// shared components

import 'package:feedback/feedback.dart';
// pub.dev packages

import '../helper/helper_functions.dart';

// helper functions

import 'package:flutter/material.dart';

import '../services/firestore.dart';
// material

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> logout() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        await user.reload();
        // Fetch latest user data
        final isVerified = user.emailVerified;
        if (isVerified) {
          // User verified,proceed with logout
          final userRef =
              FirebaseFirestore.instance.collection('users').doc(user.uid);
          await userRef.update({'isVerified': isVerified});
          // Update verification status in Firestore
          await FirebaseAuth.instance.signOut();
          // Logout user from Firebase Authentication
          if (!mounted) return;
          // pop the loading circle
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/loginOrRegister');
        } else {
          if (!mounted) return;
          // pop the loading circle
          Navigator.pop(context);
          await FirebaseAuth.instance.signOut();
          // Logout user from Firebase Authentication
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, '/loginOrRegister');
          // User not verified, show a message or handle accordingly
        }
      }
    } catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      displayMessageToUser('Error $e', context);
      print(e);
    }
  }

  void feedback() {
    // make feedback menu appear when clicked on feedback button
    BetterFeedback.of(context).show((UserFeedback feedback) async {
      // after uploading the image successfully with obtain the download URL of the image
      final String screenshotUrl = await uploadImage(feedback.screenshot);

      // we add the feedback text entered by user and
      addFeedback(feedback.text, screenshotUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          highlightColor: Colors.transparent,
          padding: EdgeInsets.only(bottom: 100, left: 20),
          iconSize: 40,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            weight: 200,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 177.0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        titleTextStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        backgroundColor: Color.fromARGB(102, 0, 127, 255),
        title: Padding(
          padding: const EdgeInsets.only(top: 77),
          child: Text('S E T T I N G S'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'General',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton1(
              onPressed: feedback,
              text: 'F E E D B A C K',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton1(
              onPressed: logout,
              text: 'L O G O U T',
            ),
          ],
        ),
      ),
    );
  }
}
