// material
import 'package:flutter/material.dart';

// firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// custom components
import 'package:code_star/helper/helper_functions.dart';
import 'package:code_star/shared_components/app_bar_box.dart';

import '../../shared_components/leaderboard_page_text.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          // any errors
          if (snapshot.hasError) {
            displayMessageToUser('Something went wrong', context);
          }
          // show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // get all users
          final users = snapshot.data!.docs;
          return Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    AppBarBox(),
                    const Divider(
                      height: 640,
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.9,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, bottom: 35),
                            child: Row(
                              children: [
                                LeaderboardText(
                                  text: user['rank'].toString(),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                LeaderboardText(
                                    text: user['username'].toString()),
                                const Spacer(),
                                LeaderboardText(
                                    text: '${user['points'].toString()} XP'),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Positioned(
                  top: 50.0, // Adjust top offset from the parent
                  left: 70.0, // Adjust left offset from the parent
                  child: Image.asset(
                    'assets/images/bar_graph.png',
                    width: 250,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
