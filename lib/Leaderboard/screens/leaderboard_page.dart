import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_star/helper/helper_functions.dart';
import 'package:code_star/shared_components/app_bar_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            StreamBuilder(

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
            if (snapshot.hasData == null) {
              return const Text("No Data");
            }

            // get all users
            final users = snapshot.data!.docs;

            return Scaffold(

              appBar: AppBar(
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
                  padding: const EdgeInsets.only(top:77),
                 ),
              ),

              body: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return Column(
                      children: [
                        SizedBox(height: 30,),

                        ListTile(
                          title: Row(
                            children: [
                              Icon(Icons.radio_button_checked),
                              Text(user['rank'].toString()),
                              Text(user['username']),
                              Text(user['points'].toString()),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            );
                  },
                ),
            Positioned(
                top: 50.0, // Adjust top offset from the parent
                left: 70.0, // Adjust left offset from the parent
                child: SvgPicture.asset(
                  'assets/images/ranking-star-solid.svg',
                  semanticsLabel: 'My SVG Image',
                  height: 200,
                ),),

          ],
        ));
  }
}
