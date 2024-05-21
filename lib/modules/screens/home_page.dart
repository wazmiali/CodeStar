import 'package:flutter/material.dart';
// material

import 'module_list_page.dart';
import '../../Leaderboard/screens/leaderboard_page.dart';
import '../../Profile/screens/profile_page.dart';
// custom widgets

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _selectedIndex = 0;

  void _navigateButtonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [ModuleList(), Profile(), Leaderboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(),
            top: BorderSide(),
            right: BorderSide(),
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // Fixed

            elevation: 22.0,
            iconSize: 35.0,
            enableFeedback: false,
            selectedItemColor: Color.fromARGB(102, 0, 127, 255),
            unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
            currentIndex: _selectedIndex,
            onTap: _navigateButtonBar,
            items: [
              // module list page
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'H O M E'),
              // profile page
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'P R O F I L E'),
              // leaderboard page
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard), label: 'R A N K'),
            ],
          ),
        ),
      ),
    );
  }
}
