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

  final List<Widget> _pages = [ModuleList(), Profile(), leaderboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateButtomBar,
        items: [
          // module list page
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // profile page
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // leaderboard page
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), label: 'Leaderboard'),
        ],
      ),
    );
  }
}
