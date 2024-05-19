import 'package:flutter/material.dart';

class AppBarBox extends StatelessWidget {
  const AppBarBox();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(102, 0, 127, 255),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      height: 220,
    );
  }
}




