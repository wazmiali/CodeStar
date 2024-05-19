import 'package:flutter/material.dart';

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

  void _navigateButtomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [ModuleList(), Profile(), Leaderboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35.0,
        selectedItemColor:  Color.fromARGB(102, 0, 127, 255),

        unselectedItemColor:Color.fromARGB(255, 0, 0, 0) ,
        currentIndex: _selectedIndex,
        onTap: _navigateButtomBar,
        items: [
          // module list page
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
          // profile page
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ' '),
          // leaderboard page
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: ' '),
        ],
      ),
    );
  }
}
