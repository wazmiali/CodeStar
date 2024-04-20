import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// firebase

import 'module_list_page.dart';
import '../../Leaderboard/screens/leaderboard_page.dart';
import '../../Profile/screens/profile_page.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  int _selectedIndex =0;

  void _navigateButtomBar(int index){

    setState(() {
      _selectedIndex = index;
    });

  }

  final List<Widget> _pages =[
    moduleList(),
    profile(),
    leaderboard()
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: GoogleFonts.roboto().fontFamily,
      //   // I can specify in the starting so I don't have to in each button or page text it applies to all
      // ),
      home: SafeArea(
        child: Scaffold(

          body: _pages[_selectedIndex],

          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(100.0), // here the desired height
          //
          //   child: AppBar(
          //     toolbarHeight: 100.0,
          //     centerTitle: true,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.vertical(
          //         bottom: Radius.circular(20),
          //       ),
          //     ),
          //     titleTextStyle: TextStyle(
          //       fontSize: 36
          //     ),
          //     backgroundColor: Colors.blue[900],
          //     title: Text('M O D U L E S'),
          //   ),
          // ),

          //
          // body: SingleChildScrollView(
          //   child: Center(
          //     child: Column(
          //       children: [
          //         const SizedBox(
          //           height: 50,
          //         ),
          //
          //         InkWell(
          //           onTap: (() {}),
          //           child: Ink(
          //             width: 335,
          //             height: 85,
          //             child: const Center(
          //               child: Text(
          //                 "Introduction",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 0, 0, 0),
          //                     fontSize: 30),
          //               ),
          //             ),
          //             decoration: BoxDecoration(
          //                // color: const Color(0xff0d47a1),
          //                 borderRadius: BorderRadius.circular(8),
          //                 border: Border.all(
          //                     color: const Color.fromARGB(255, 13, 71, 161))),
          //           ),
          //         ),
          //
          //         const SizedBox(
          //           height: 25,
          //         ),
          //
          //         InkWell(
          //           onTap: (() {}),
          //           child: Ink(
          //             width: 335,
          //             height: 85,
          //             child: const Center(
          //               child: Text(
          //                 "History",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 0, 0, 0),
          //                     fontSize: 30),
          //               ),
          //             ),
          //             decoration: BoxDecoration(
          //               // color: const Color(0xff0d47a1),
          //                 borderRadius: BorderRadius.circular(8),
          //                 border: Border.all(
          //                     color: const Color.fromARGB(255, 161, 13, 149))),
          //           ),
          //         ),
          //
          //         const SizedBox(
          //           height: 25,
          //         ),
          //
          //         InkWell(
          //           onTap: (() {}),
          //           child: Ink(
          //             width: 335,
          //             height: 85,
          //             child: const Center(
          //               child: Text(
          //                 "Usage",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 0, 0, 0),
          //                     fontSize: 30),
          //               ),
          //             ),
          //             decoration: BoxDecoration(
          //               // color: const Color(0xff0d47a1),
          //                 borderRadius: BorderRadius.circular(8),
          //                 border: Border.all(
          //                     color: const Color.fromARGB(255, 161, 131, 13))),
          //           ),
          //         ),
          //
          //         const SizedBox(
          //           height: 25,
          //         ),
          //
          //         InkWell(
          //           onTap: (() {}),
          //           child: Ink(
          //             width: 335,
          //             height: 85,
          //             child: const Center(
          //               child: Text(
          //                 "Data types",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 0, 0, 0),
          //                     fontSize: 30),
          //               ),
          //             ),
          //             decoration: BoxDecoration(
          //               // color: const Color(0xff0d47a1),
          //                 borderRadius: BorderRadius.circular(8),
          //                 border: Border.all(
          //                     color: const Color.fromARGB(255, 13, 161, 99))),
          //           ),
          //         ),
          //
          //         const SizedBox(
          //           height: 25,
          //         ),
          //
          //         InkWell(
          //           onTap: (() {}),
          //           child: Ink(
          //             width: 335,
          //             height: 85,
          //             child: const Center(
          //               child: Text(
          //                 "Oops",
          //                 style: TextStyle(
          //                     color: Color.fromARGB(255, 0, 0, 0),
          //                     fontSize: 30),
          //               ),
          //             ),
          //             decoration: BoxDecoration(
          //               // color: const Color(0xff0d47a1),
          //                 borderRadius: BorderRadius.circular(8),
          //                 border: Border.all(
          //                     color: const Color.fromARGB(255, 161, 13, 87))),
          //           ),
          //         ),
          //
          //       ],
          //     ),
          //   ),
          // ),

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _navigateButtomBar,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
              ],
            ),


        ),
      ),
    );
  }
}

// Logout page below

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      user.reload(); // Fetch latest user data
      if (user.emailVerified) {
        final userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        userRef.update({'isVerified': true});
      } else {
        final userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        userRef.update({'isVerified': false});
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            child: Center(
              child: Text(
                'Welcome to Homepage',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            margin: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 450),
          ),
          FilledButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
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
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  await user.reload();
                  // Fetch latest user data
                  final isVerified = user.emailVerified;
                  if (isVerified) {
                    // User verified, proceed with logout
                    if (user != null) {
                      final userRef = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid);
                      await userRef.update({
                        'isVerified': isVerified
                      }); // Update verification status in Firestore
                      await FirebaseAuth.instance
                          .signOut(); // Logout user from Firebase Authentication
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                  } else {
                    await FirebaseAuth.instance
                        .signOut(); // Logout user from Firebase Authentication
                    Navigator.pushReplacementNamed(context, '/login');
                    // User not verified, show a message or handle accordingly
                  }
                }
              },
              child: Text('Log out')),
        ]),
      ),
    );
  }
}
