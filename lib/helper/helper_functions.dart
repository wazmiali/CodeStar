import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Center(

        child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1.0))),
              title: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Center(child: Text(message)),
              ),
            ),
      ));
}





