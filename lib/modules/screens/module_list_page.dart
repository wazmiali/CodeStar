import 'package:firebase_auth/firebase_auth.dart';
// firebase

import 'package:flutter/material.dart';

class ModuleList extends StatefulWidget {
  const ModuleList({Key? key}) : super(key: key);

  // above is constructor the same constructor as we have in java

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 177.0,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => {FirebaseAuth.instance.signOut(),
              Navigator.pushReplacementNamed(context, '/loginOrRegister')

              },
              icon: Icon(Icons.logout_outlined))
        ],
        titleTextStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        backgroundColor: Color.fromARGB(102, 0, 127, 255),
        title: Padding(
          padding: const EdgeInsets.only(top:77),
          child: Text('M O D U L E S'),
        ),
      ),

      body: SingleChildScrollView(

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
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
