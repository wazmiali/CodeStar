import 'package:cloud_firestore/cloud_firestore.dart';
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
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(102, 0, 127, 255),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            height: 220,
                          ),

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

                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            height: 2,
                          ),
                          // statistic

                          const Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              'Statistic',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),

                          // points scored, current rank
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 160,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.bolt,
                                          size: 50,
                                          color:
                                          Color.fromARGB(255, 255, 215, 0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Text(
                                            "${user['points']}xp",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 160,
                                    height: 60,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.military_tech,
                                          size: 45,
                                          color:
                                          Color.fromARGB(255, 255, 215, 0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Text(
                                            "#${user['rank']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 28),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          )
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
                            onPressed: () {},
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
