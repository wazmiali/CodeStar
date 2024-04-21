import 'package:flutter/material.dart';

// firebase

class moduleList extends StatefulWidget {
  const moduleList({Key? key}) : super(key: key);
  // above is constructor the same constructor as we have in java

  @override
  State<moduleList> createState() => _moduleListState();
}

class _moduleListState extends State<moduleList> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            titleTextStyle: TextStyle(
                fontSize: 36
            ),
            backgroundColor: Colors.blue[900],
            title: Text('M O D U L E S'),
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
                            fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: const Color(0xff0d47a1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 13, 71, 161))),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                InkWell(
                  onTap: (() {}),
                  child: Ink(
                    width: 335,
                    height: 85,
                    child: const Center(
                      child: Text(
                        "History",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: const Color(0xff0d47a1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 161, 13, 149))),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                InkWell(
                  onTap: (() {}),
                  child: Ink(
                    width: 335,
                    height: 85,
                    child: const Center(
                      child: Text(
                        "Usage",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: const Color(0xff0d47a1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 161, 131, 13))),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                InkWell(
                  onTap: (() {}),
                  child: Ink(
                    width: 335,
                    height: 85,
                    child: const Center(
                      child: Text(
                        "Data types",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: const Color(0xff0d47a1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 13, 161, 99))),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                InkWell(
                  onTap: (() {}),
                  child: Ink(
                    width: 335,
                    height: 85,
                    child: const Center(
                      child: Text(
                        "Oops",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 30),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: const Color(0xff0d47a1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(255, 161, 13, 87))),
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
