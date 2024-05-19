import 'package:flutter/material.dart';

class StatisticsDisplayBox extends StatelessWidget {
  final String text;
  // final Icon icon;
  final IconData next;


  StatisticsDisplayBox({required this.text, required this.next}

      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 160,
      height: 60,
      child: Row(
        children: [
          Icon(next ,
            size: 45,
            color: Color.fromARGB(255, 255, 215, 0),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}
