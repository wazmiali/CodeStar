import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_star/shared_components/app_bar_box.dart';
import 'package:code_star/shared_components/statistics_display_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: getUserDetails(),
            builder: (context, snapshot) {
              // loading.. if the response is waiting for some reason
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // error
              else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              // data received
              else if (snapshot.hasData) {
                Map<String, dynamic>? user = snapshot.data!.data();
                String name =
                    user!['email']!.substring(0, user['email'].indexOf('@'));

                return Scaffold(
                  body: Stack(
                    children: [
                      // Your background content
                      SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBarBox(),
                          SizedBox(
                            height: 160,
                          ),
                          // name of user
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              name,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // display username
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              '@${user['username']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          const Divider(
                            height: 5,
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          // statistic

                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Statistic',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          // points scored, current rank
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  StatisticsDisplayBox(
                                      text: "${user['points']}XP",
                                      next: Icons.bolt),
                                ],
                              ),
                              Row(
                                children: [
                                  StatisticsDisplayBox(
                                      text: "#${user['rank']}",
                                      next: Icons.military_tech),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                      Positioned(
                          top: 110.0, // Adjust top offset from the parent
                          left: 75.0, // Adjust left offset from the parent
                          child: CircleAvatar(
                            maxRadius: 120,
                            backgroundImage:
                                AssetImage('assets/images/profile_image.png'),
                          )),
                      Positioned(
                        top: 45.0, // Adjust top offset from the parent
                        left: 320.0, // Adjust left offset from the parent
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/settings');
                            },
                            icon: const Icon(
                              Icons.settings_sharp,
                              size: 40.0,
                              color: Color(0xffffffff),
                            )),
                      ),
                    ],
                  ),
                );
              } else {
                return Text("No data");
              }
            }));
  }
}
