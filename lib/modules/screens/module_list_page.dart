import 'package:firebase_auth/firebase_auth.dart';
// firebase

import 'package:flutter/material.dart';

class moduleList extends StatefulWidget {
  const moduleList({Key? key}) : super(key: key);

  // above is constructor the same constructor as we have in java

  @override
  State<moduleList> createState() => _moduleListState();
}

class _moduleListState extends State<moduleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // here the desired height

        child: AppBar(
          toolbarHeight: 100.0,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => {FirebaseAuth.instance.signOut()},
                icon: Icon(Icons.logout_outlined))
          ],
          titleTextStyle: TextStyle(fontSize: 36),
          backgroundColor: Color(0xff035fa8),
          title: Text('M O D U L E S'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: (() {}),
                  child: Ink(
                    width: 335,
                    height: 85,
                    child: const Center(
                      child: Text(
                        "Introduction",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 30,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        // color: const Color(0xff0d47a1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 13, 71, 161))),
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
